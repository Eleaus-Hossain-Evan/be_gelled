import 'package:be_gelled/application/auth/auth_provider.dart';
import 'package:be_gelled/domain/cart/model/food_item_mode.dart';
import 'package:be_gelled/route/go_router.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/cart/order_body.dart';
import '../../infrastructure/cart_repo.dart';
import '../../presentation/home/home_screen.dart';
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

  void getCalorieSuggestion() async {
    state = state.copyWith(loading: true);

    final result = await repo.getCalorieSuggestion();

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        return state.copyWith(
          calorieModel: r.data,
          loading: false,
        );
      },
    );
  }

  void getProductGroupByCategory() async {
    state = state.copyWith(loading: true);

    final result = await repo.getProductGroupByCategory();

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        return state.copyWith(
          allTypedFoods: r,
          loading: false,
        );
      },
    );
  }

  // Future<Either<CleanFailure, OrderResponse>>
  void placeOrder({
    String coupon = '',
    int deliveryCharge = 0,
    int discount = 0,
    int paymentType = 2,
    DayChoice? dayChoice,
  }) async {
    state = state.copyWith(loading: true);

    final user = ref.watch(authProvider).user;

    final body = OrderBody(
      addressInfo: user.addressInfo,
      coupon: coupon,
      customer: user.id,
      deliveryCharge: deliveryCharge,
      discount: discount,
      paymentType: paymentType,
      products: state.selectedFoodItems.unlock,
      total: state.selectedFoodItems
          .map((e) => e.quantity)
          .reduce((v, e) => v + e)
          .toInt(),
      vendor: '647789b4a73631614454da54',
      weekDays: dayChoice == null
          ? []
          : dayChoice == DayChoice.days2
              ? ["Sunday", "Wednesday"]
              : ["Sunday", "Tuesday", "Thursday"],
    );

    Logger.i(body);

    state = state.copyWith(loading: false);
    final result = await repo.placeOrder(body);

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        showToast(r.message);

        ref.read(familyProvider.notifier).update((state) => state = false);

        ref.read(routerProvider).pop();
        ref.read(routerProvider).pop();

        return state.copyWith(loading: false);
      },
    );
    // return result;
  }
}
