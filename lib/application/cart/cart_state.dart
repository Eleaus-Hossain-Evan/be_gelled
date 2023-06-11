import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/cart/all_products_response.dart';
import '../../domain/cart/model/calorie_model.dart';
import '../../domain/cart/model/food_item_mode.dart';
import '../../utils/network_util/network_failure.dart';

enum DayChoice { days2, days3 }

class CartState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<FoodItemModel> selectedFoodItems;
  final AllProductsResponse allTypedFoods;
  final CalorieModel calorieModel;
  // final AddressModel address;

  const CartState({
    required this.loading,
    required this.failure,
    required this.selectedFoodItems,
    required this.allTypedFoods,
    required this.calorieModel,
  });

  factory CartState.init() => CartState(
        loading: false,
        failure: CleanFailure.none(),
        selectedFoodItems: const IListConst(<FoodItemModel>[]),
        allTypedFoods: AllProductsResponse.init(),
        calorieModel: CalorieModel.init(),
        // address: AddressModel.init(),
      );

  CartState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<FoodItemModel>? selectedFoodItems,
    AllProductsResponse? allTypedFoods,
    CalorieModel? calorieModel,
  }) {
    return CartState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      selectedFoodItems: selectedFoodItems ?? this.selectedFoodItems,
      allTypedFoods: allTypedFoods ?? this.allTypedFoods,
      calorieModel: calorieModel ?? this.calorieModel,
    );
  }

  @override
  String toString() {
    return 'CartState(loading: $loading, failure: $failure, selectedFoodItems: $selectedFoodItems, )';
  }

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      selectedFoodItems,
      allTypedFoods,
      calorieModel,
    ];
  }
}
