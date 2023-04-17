import 'dart:convert';

import 'package:equatable/equatable.dart';

class CountryCodeModel extends Equatable {
  final String name;
  final String code;
  final String extension;

  const CountryCodeModel({
    required this.name,
    required this.code,
    required this.extension,
  });

  factory CountryCodeModel.init() {
    return const CountryCodeModel(
      name: '',
      code: '',
      extension: '',
    );
  }

  CountryCodeModel copyWith({
    String? name,
    String? code,
    String? extension,
  }) {
    return CountryCodeModel(
      name: name ?? this.name,
      code: code ?? this.code,
      extension: extension ?? this.extension,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'extension': extension,
    };
  }

  factory CountryCodeModel.fromMap(Map<String, dynamic> map) {
    return CountryCodeModel(
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      extension: map['extension'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryCodeModel.fromJson(String source) =>
      CountryCodeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CountryCodeModel(name: $name, code: $code, extension: $extension)';

  @override
  List<Object> get props => [name, code, extension];
}
