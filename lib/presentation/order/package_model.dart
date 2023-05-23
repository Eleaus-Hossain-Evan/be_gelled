import 'package:equatable/equatable.dart';

class PackageModel extends Equatable {
  final String name;
  final List<PackageItemModel> items;
  const PackageModel({
    required this.name,
    required this.items,
  });

  PackageModel copyWith({
    String? name,
    List<PackageItemModel>? items,
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
      items: List<PackageItemModel>.from(
          map['items']?.map((x) => PackageItemModel.fromMap(x)) ?? const []),
    );
  }

  @override
  String toString() => 'PackageModel(name: $name, items: $items)';

  @override
  List<Object> get props => [name, items];
}

class PackageItemModel extends Equatable {
  final String name;
  final double amount;

  const PackageItemModel({
    required this.name,
    required this.amount,
  });

  PackageItemModel copyWith({
    String? name,
    double? price,
  }) {
    return PackageItemModel(
      name: name ?? this.name,
      amount: price ?? amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': amount,
    };
  }

  factory PackageItemModel.fromMap(Map<String, dynamic> map) {
    return PackageItemModel(
      name: map['name'] ?? '',
      amount: map['price']?.toDouble() ?? 0.0,
    );
  }

  @override
  String toString() => 'PackageItemModel(name: $name, price: $amount)';

  @override
  List<Object> get props => [name, amount];
}
