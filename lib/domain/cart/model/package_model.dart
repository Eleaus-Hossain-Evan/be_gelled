import 'package:equatable/equatable.dart';

import 'food_item_mode.dart';

class PackageModel extends Equatable {
  final String name;
  final List<FoodItemModel> items;
  const PackageModel({
    required this.name,
    required this.items,
  });

  PackageModel copyWith({
    String? name,
    List<FoodItemModel>? items,
  }) {
    return PackageModel(
      name: name ?? this.name,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      name: map['name'] ?? '',
      items: List<FoodItemModel>.from(
          map['items']?.map((x) => FoodItemModel.fromMap(x)) ?? const []),
    );
  }

  @override
  String toString() => 'PackageModel(name: $name, items: $items)';

  @override
  List<Object> get props => [name, items];
}
