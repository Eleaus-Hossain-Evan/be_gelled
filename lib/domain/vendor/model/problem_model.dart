import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProblemModel extends Equatable {
  final String id;
  final String name;
  final String nameInArabic;

  const ProblemModel({
    required this.id,
    required this.name,
    required this.nameInArabic,
  });

  factory ProblemModel.init() {
    return const ProblemModel(
      id: '',
      name: '',
      nameInArabic: '',
    );
  }

  ProblemModel copyWith({
    String? id,
    String? name,
    String? nameInArabic,
  }) {
    return ProblemModel(
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

  factory ProblemModel.fromMap(Map<String, dynamic> map) {
    return ProblemModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      nameInArabic: map['nameInArabic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemModel.fromJson(String source) =>
      ProblemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Problem(_id: $id, name: $name, nameInArabic: $nameInArabic)';

  @override
  List<Object> get props => [id, name, nameInArabic];
}
