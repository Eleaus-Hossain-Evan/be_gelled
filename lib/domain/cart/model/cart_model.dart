import 'dart:convert';

import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final int quantity;
  final bool isSelected;

  const CartModel({
    required this.quantity,
    required this.isSelected,
  });

  CartModel copyWith({
    int? quantity,
    bool? isSelected,
  }) {
    return CartModel(
      quantity: quantity ?? this.quantity,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      quantity: map['quantity']?.toInt() ?? 0,
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CartModel(quantity: $quantity, isSelected: $isSelected)';

  @override
  List<Object> get props => [quantity, isSelected];
}
