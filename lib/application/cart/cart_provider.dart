import 'package:be_gelled/domain/cart/model/food_item_mode.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/cart/order_body.dart';
import '../../domain/cart/order_response.dart';
import '../../infrastructure/cart_repo.dart';
import '../../utils/utils.dart';
import '../global.dart';
import 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(ref, CartRepo());
}, name: 'cartProvider');

class CartNotifier extends StateNotifier<CartState> {
  final Ref ref;
  final CartRepo repo;
  CartNotifier(this.ref, this.repo) : super(CartState.init());

  // void setAddress(
  //   AddressModel address,
  // ) {
  //   state = state.copyWith(
  //     address: address,
  //   );
  // }

  void addToCart(FoodItemModel model) {
    state =
        state.copyWith(selectedFoodItems: state.selectedFoodItems.add(model));
  }

  void removeFromCart(FoodItemModel items) {
    state = state.copyWith(
      selectedFoodItems:
          state.selectedFoodItems.removeWhere((e) => e.id == items.id),
    );
  }

  void clearCart() {
    state = state.copyWith(selectedFoodItems: state.selectedFoodItems.clear());
  }

  void updateCartItem(FoodItemModel item) {
    state = state.copyWith(
      selectedFoodItems: state.selectedFoodItems
          .map((e) => e.id == item.id ? item : e)
          .toList()
          .lock,
    );
  }

  void toggolAll(bool? isSelected) {
    // state = state.copyWith(
    //   items: state.items
    //       .map((e) {
    //         return e.copyWith(isSelected: isSelected);
    //       })
    //       .toList()
    //       .lock,
    // );
  }

  Future<Either<CleanFailure, OrderResponse>> placeOrder(OrderBody body) async {
    state = state.copyWith(loading: true);

    final result = await repo.placeOrder(body);

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        showToast(r.message);

        return state.copyWith(loading: false);
      },
    );
    return result;
  }
}
