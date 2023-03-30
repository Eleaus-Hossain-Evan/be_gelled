import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarServiceModel extends Equatable {
  final String id;
  final String year;
  final String carName;
  final String carModel;
  final String subModel;
  final String engine;
  final String image;
  final String details;
  final String color;

  const CarServiceModel({
    required this.id,
    required this.year,
    required this.carName,
    required this.carModel,
    required this.subModel,
    required this.engine,
    required this.image,
    required this.details,
    required this.color,
  });

  factory CarServiceModel.init() => const CarServiceModel(
        id: '',
        year: '',
        carName: '',
        carModel: '',
        subModel: '',
        engine: '',
        image: '',
        color: '',
        details: '',
      );

  CarServiceModel copyWith({
    String? id,
    String? year,
    String? carName,
    String? carModel,
    String? subModel,
    String? engine,
    String? image,
    String? details,
    String? color,
  }) {
    return CarServiceModel(
      id: id ?? this.id,
      year: year ?? this.year,
      carName: carName ?? this.carName,
      carModel: carModel ?? this.carModel,
      subModel: subModel ?? this.subModel,
      engine: engine ?? this.engine,
      image: image ?? this.image,
      details: details ?? this.details,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'year': year,
      'carName': carName,
      'carModel': carModel,
      'subModel': subModel,
      'engine': engine,
      'image': image,
      'details': details,
      'color': color,
    };
  }

  Map<String, dynamic> toColorMap() {
    return {
      'year': year,
      'carName': carName,
      'carModel': carModel,
      'subModel': subModel,
      'engine': engine,
      'color': color,
    };
  }

  Map<String, dynamic> toEngineMap() {
    return {
      'year': year,
      'carName': carName,
      'carModel': carModel,
      'subModel': subModel,
      'engine': engine,
    };
  }

  Map<String, dynamic> toSubMap() {
    return {
      'year': year,
      'carName': carName,
      'carModel': carModel,
      'subModel': subModel
    };
  }

  Map<String, dynamic> toModelMap() {
    return {
      'year': year,
      'carName': carName,
      'carModel': carModel,
    };
  }

  Map<String, dynamic> toNameMap() {
    return {
      'year': year,
      'carName': carName,
    };
  }

  Map<String, dynamic> toYearMap() {
    return {
      'year': year,
    };
  }

  factory CarServiceModel.fromMap(Map<String, dynamic> map) {
    return CarServiceModel(
      id: map['_id'] ?? '',
      year: map['year'] ?? '',
      carName: map['carName'] ?? '',
      carModel: map['carModel'] ?? '',
      subModel: map['subModel'] ?? '',
      engine: map['engine'] ?? '',
      image: map['image'] ?? '',
      details: map['details'] ?? '',
      color: map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarServiceModel.fromJson(String source) =>
      CarServiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarServiceModel(id: $id, year: $year, carName: $carName, carModel: $carModel, subModel: $subModel, engine: $engine, image: $image, details: $details, color: $color)';
  }

  @override
  List<Object> get props {
    return [
      id,
      year,
      carName,
      carModel,
      subModel,
      engine,
      image,
      details,
      color,
    ];
  }
}
