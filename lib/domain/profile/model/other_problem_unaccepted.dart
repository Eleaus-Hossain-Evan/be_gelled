import 'dart:convert';

import 'vendro_info.dart';
import 'package:equatable/equatable.dart';

import '../../car/model/car_service_model.dart';

class NotificationModel extends Equatable {
  final String id;
  final String packageId;
  final CarServiceModel carService;
  final String othersProblem;
  final List<VendorInfo> vendorInfo;
  const NotificationModel({
    required this.id,
    required this.packageId,
    required this.carService,
    required this.othersProblem,
    required this.vendorInfo,
  });

  NotificationModel copyWith({
    String? id,
    String? packageId,
    CarServiceModel? carService,
    String? othersProblem,
    List<VendorInfo>? vendorInfo,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      carService: carService ?? this.carService,
      othersProblem: othersProblem ?? this.othersProblem,
      vendorInfo: vendorInfo ?? this.vendorInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'packageId': packageId,
      'carService': carService.toMap(),
      'othersProblem': othersProblem,
      'vendorInfo': vendorInfo.map((x) => x.toMap()).toList(),
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['_id'] ?? '',
      packageId: map['packageId'] ?? '',
      carService: map['carService'] == null
          ? CarServiceModel.init()
          : CarServiceModel.fromMap(map['carService']),
      othersProblem: map['othersProblem'] ?? '',
      vendorInfo: List<VendorInfo>.from(
          map['vendorInfo']?.map((x) => VendorInfo.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(_id: $id, packageId: $packageId, carService: $carService, othersProblem: $othersProblem, vendorInfo: $vendorInfo)';
  }

  @override
  List<Object> get props {
    return [
      id,
      packageId,
      carService,
      othersProblem,
      vendorInfo,
    ];
  }
}
