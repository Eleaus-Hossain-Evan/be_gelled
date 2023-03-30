import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceProblemModel extends Equatable {
  final String id;
  final String name;
  final String nameInArabic;

  const ServiceProblemModel({
    required this.id,
    required this.name,
    required this.nameInArabic,
  });

  factory ServiceProblemModel.init() => const ServiceProblemModel(
        id: '',
        name: '',
        nameInArabic: '',
      );

  ServiceProblemModel copyWith({
    String? id,
    String? name,
    String? nameInArabic,
  }) {
    return ServiceProblemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameInArabic: nameInArabic ?? this.nameInArabic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'nameInArabic': nameInArabic,
    };
  }

  factory ServiceProblemModel.fromMap(Map<String, dynamic> map) {
    return ServiceProblemModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      nameInArabic: map['nameInArabic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProblemModel.fromJson(String source) =>
      ServiceProblemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Data(_id: $id, name: $name, nameInArabic: $nameInArabic)';

  @override
  List<Object> get props => [id, name, nameInArabic];
}
