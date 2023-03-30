import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomerInfoModel extends Equatable {
  final String id;
  final String name;
  final String profilePicture;

  const CustomerInfoModel({
    required this.id,
    required this.name,
    required this.profilePicture,
  });

  factory CustomerInfoModel.init() {
    return const CustomerInfoModel(
      id: '',
      name: '',
      profilePicture: '',
    );
  }

  CustomerInfoModel copyWith({
    String? id,
    String? name,
    String? profilePicture,
  }) {
    return CustomerInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'profilePicture': profilePicture,
    };
  }

  factory CustomerInfoModel.fromMap(Map<String, dynamic> map) {
    return CustomerInfoModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerInfoModel.fromJson(String source) =>
      CustomerInfoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserInfo(_id: $id, name: $name, profilePicture: $profilePicture)';

  @override
  List<Object> get props => [id, name, profilePicture];
}
