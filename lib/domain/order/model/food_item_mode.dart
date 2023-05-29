import 'package:equatable/equatable.dart';

class FoodItemModel extends Equatable {
  final String id;
  final String name;
  final String nameInBengali;
  final String image;
  final List<String> typeByNutrients;
  final String category;
  final int caloriesPerHundredGram;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final double quantity;

  const FoodItemModel({
    required this.id,
    required this.name,
    required this.nameInBengali,
    required this.image,
    required this.typeByNutrients,
    required this.category,
    required this.caloriesPerHundredGram,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.quantity,
  });

  FoodItemModel copyWith({
    String? id,
    String? name,
    String? nameInBengali,
    String? image,
    List<String>? typeByNutrients,
    String? category,
    int? caloriesPerHundredGram,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    double? quantity,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameInBengali: nameInBengali ?? this.nameInBengali,
      image: image ?? this.image,
      typeByNutrients: typeByNutrients ?? this.typeByNutrients,
      category: category ?? this.category,
      caloriesPerHundredGram:
          caloriesPerHundredGram ?? this.caloriesPerHundredGram,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'nameInBengali': nameInBengali,
      'image': image,
      'typeByNutrients': typeByNutrients,
      'category': category,
      'caloriesPerHundredGram': caloriesPerHundredGram,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'quantity': quantity,
    };
  }

  factory FoodItemModel.fromMap(Map<String, dynamic> map) {
    return FoodItemModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      nameInBengali: map['nameInBengali'] ?? '',
      image: map['image'] ?? '',
      typeByNutrients: List<String>.from(map['typeByNutrients'] ?? const []),
      category: map['category'] ?? '',
      caloriesPerHundredGram: map['caloriesPerHundredGram']?.toInt() ?? 0,
      isDeleted: map['isDeleted'] ?? false,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      quantity:
          map['quantity'] == null ? 0.0 : map['quantity']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'FoodItemModel(id: $id, name: $name, nameInBengali: $nameInBengali, caloriesPerHundredGram: $caloriesPerHundredGram, quantity: $quantity)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      nameInBengali,
      image,
      typeByNutrients,
      category,
      caloriesPerHundredGram,
      isDeleted,
      createdAt,
      updatedAt,
      quantity,
    ];
  }
}
