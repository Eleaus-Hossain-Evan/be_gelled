import 'dart:convert';

import 'package:equatable/equatable.dart';

class PartsModel extends Equatable {
  final String id;
  final String name;
  final String nameInArabic;

  const PartsModel({
    required this.id,
    required this.name,
    required this.nameInArabic,
  });

  factory PartsModel.init() {
    return const PartsModel(
      id: '',
      name: '',
      nameInArabic: '',
    );
  }

  PartsModel copyWith({
    String? id,
    String? name,
    String? nameInArabic,
  }) {
    return PartsModel(
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

  factory PartsModel.fromMap(Map<String, dynamic> map) {
    return PartsModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      nameInArabic: map['nameInArabic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PartsModel.fromJson(String source) =>
      PartsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Parts(_id: $id, name: $name, nameInArabic: $nameInArabic)';

  @override
  List<Object> get props => [id, name, nameInArabic];
}
