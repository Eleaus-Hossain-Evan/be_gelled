import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../car_parts/model/car_parts_model.dart';

class CartModel extends Equatable {
  final CarPartsModel product;
  final int quantity;
  final bool isSelected;

  const CartModel({
    required this.product,
    required this.quantity,
    required this.isSelected,
  });

  CartModel copyWith({
    CarPartsModel? product,
    int? quantity,
    bool? isSelected,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      product: CarPartsModel.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CartModel(product: $product, quantity: $quantity, isSelected: $isSelected)';

  @override
  List<Object> get props => [product, quantity, isSelected];
}
