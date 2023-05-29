import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/cart/model/address_model.dart';
import '../../domain/order/all_products_response.dart';
import '../../domain/order/model/food_item_mode.dart';
import '../../utils/network_util/network_failure.dart';

class CartState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<FoodItemModel> selectedFoodItems;
  final AllProductsResponse allTypedFoods;
  // final AddressModel address;

  const CartState({
    required this.loading,
    required this.failure,
    required this.selectedFoodItems,
    required this.allTypedFoods,
  });

  factory CartState.init() => CartState(
        loading: false,
        failure: CleanFailure.none(),
        selectedFoodItems: const IListConst(<FoodItemModel>[]),
        allTypedFoods: all_products,
        // address: AddressModel.init(),
      );

  CartState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<FoodItemModel>? selectedFoodItems,
    AllProductsResponse? allTypedFoods,
  }) {
    return CartState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      selectedFoodItems: selectedFoodItems ?? this.selectedFoodItems,
      allTypedFoods: allTypedFoods ?? this.allTypedFoods,
    );
  }

  @override
  String toString() {
    return 'CartState(loading: $loading, failure: $failure, selectedFoodItems: $selectedFoodItems)';
  }

  @override
  List<Object> get props =>
      [loading, failure, selectedFoodItems, allTypedFoods];
}
