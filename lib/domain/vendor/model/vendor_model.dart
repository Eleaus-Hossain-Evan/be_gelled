import 'dart:convert';

import 'package:equatable/equatable.dart';

class VendorModel extends Equatable {
  final String id;
  final String name;
  final String nameInArabic;
  final String phone;
  final String profilePicture;
  final String email;
  final String companyName;
  final double averageRating;
  final double totalServiceSolved;
  final String cityName;
  final String mapLocation;

  const VendorModel({
    required this.id,
    required this.name,
    required this.nameInArabic,
    required this.phone,
    required this.profilePicture,
    required this.email,
    required this.companyName,
    required this.averageRating,
    required this.totalServiceSolved,
    required this.cityName,
    required this.mapLocation,
  });

  factory VendorModel.init() {
    return const VendorModel(
      id: '',
      name: '',
      phone: '',
      profilePicture: '',
      email: '',
      companyName: '',
      nameInArabic: '',
      averageRating: 0.0,
      totalServiceSolved: 0,
      cityName: '',
      mapLocation: '',
    );
  }

  VendorModel copyWith({
    String? id,
    String? name,
    String? nameInArabic,
    String? phone,
    String? profilePicture,
    String? email,
    String? companyName,
    double? averageRating,
    double? totalServiceSolved,
    String? cityName,
    String? mapLocation,
  }) {
    return VendorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameInArabic: nameInArabic ?? this.nameInArabic,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      email: email ?? this.email,
      companyName: companyName ?? this.companyName,
      averageRating: averageRating ?? this.averageRating,
      totalServiceSolved: totalServiceSolved ?? this.totalServiceSolved,
      cityName: cityName ?? this.cityName,
      mapLocation: mapLocation ?? this.mapLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'nameInArabic': nameInArabic,
      'phone': phone,
      'profilePicture': profilePicture,
      'email': email,
      'companyName': companyName,
      'averageRating': averageRating,
      'totalServiceSolved': totalServiceSolved,
      'cityName': cityName,
      'mapLocation': mapLocation,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      nameInArabic: map['nameInArabic'] ?? '',
      phone: map['phone'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      email: map['email'] ?? '',
      companyName: map['companyName'] ?? '',
      averageRating: map['averageRating']?.toDouble() ?? 0.0,
      totalServiceSolved: map['totalServiceSolved']?.toDouble() ?? 0.0,
      cityName: map['cityName'] ?? '',
      mapLocation: map['mapLocation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorModel.fromJson(String source) =>
      VendorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VendorModel(id: $id, name: $name, nameInArabic: $nameInArabic, phone: $phone, profilePicture: $profilePicture, email: $email, companyName: $companyName, averageRating: $averageRating, totalServiceSolved: $totalServiceSolved, cityName: $cityName, mapLocation: $mapLocation)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      nameInArabic,
      phone,
      profilePicture,
      email,
      companyName,
      averageRating,
      totalServiceSolved,
      cityName,
      mapLocation,
    ];
  }
}
