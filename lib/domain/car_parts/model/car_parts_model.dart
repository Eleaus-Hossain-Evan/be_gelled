import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../car/model/car_model.dart';
import '../../vendor/model/vendor_model.dart';
import 'parts_model.dart';

class CarPartsModel extends Equatable {
  final String id;
  final VendorModel vendor;
  final PartsModel parts;
  final String identificationNumber;
  final double amount;
  final String image;
  final CarModel car;
  final String details;
  final String type;
  final double averageRating;
  final int totalSold;

  const CarPartsModel({
    required this.id,
    required this.vendor,
    required this.parts,
    required this.identificationNumber,
    required this.amount,
    required this.image,
    required this.car,
    required this.details,
    required this.type,
    required this.averageRating,
    required this.totalSold,
  });

  factory CarPartsModel.init() {
    return CarPartsModel(
      id: '',
      vendor: VendorModel.init(),
      parts: PartsModel.init(),
      identificationNumber: '',
      amount: 0.0,
      image: '',
      car: CarModel.init(),
      details: '',
      type: '',
      averageRating: 0.0,
      totalSold: 0,
    );
  }

  CarPartsModel copyWith({
    String? id,
    VendorModel? vendor,
    PartsModel? parts,
    String? identificationNumber,
    double? amount,
    String? image,
    CarModel? car,
    String? details,
    String? type,
    double? averageRating,
    int? totalSold,
  }) {
    return CarPartsModel(
      id: id ?? this.id,
      vendor: vendor ?? this.vendor,
      parts: parts ?? this.parts,
      identificationNumber: identificationNumber ?? this.identificationNumber,
      amount: amount ?? this.amount,
      image: image ?? this.image,
      car: car ?? this.car,
      details: details ?? this.details,
      type: type ?? this.type,
      averageRating: averageRating ?? this.averageRating,
      totalSold: totalSold ?? this.totalSold,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vendor': vendor.toMap(),
      'parts': parts.toMap(),
      'identificationNumber': identificationNumber,
      'amount': amount,
      'image': image,
      'car': car.toMap(),
      'details': details,
      'type': type,
      'averageRating': averageRating,
      'totalSold': totalSold,
    };
  }

  factory CarPartsModel.fromMap(Map<String, dynamic> map) {
    return CarPartsModel(
      id: map['_id'] ?? '',
      vendor: VendorModel.fromMap(map['vendor']),
      parts: PartsModel.fromMap(map['parts']),
      identificationNumber: map['identificationNumber'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
      car: CarModel.fromMap(map['car']),
      details: map['details'] ?? '',
      type: map['type'] ?? '',
      averageRating: map['averageRating']?.toDouble() ?? 0.0,
      totalSold: map['totalSold']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarPartsModel.fromJson(String source) =>
      CarPartsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarPartsModel(id: $id, vendor: $vendor, parts: $parts, identificationNumber: $identificationNumber, amount: $amount, image: $image, car: $car, details: $details, type: $type, averageRating: $averageRating, totalSold: $totalSold)';
  }

  @override
  List<Object> get props {
    return [
      id,
      vendor,
      parts,
      identificationNumber,
      amount,
      image,
      car,
      details,
      type,
      averageRating,
      totalSold,
    ];
  }
}
