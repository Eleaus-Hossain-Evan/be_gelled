import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../car/model/car_service_model.dart';
import '../../vendor/model/vendor_model.dart';

import 'other_problem_model.dart';
import 'service_problem_model.dart';

class PackageModel extends Equatable {
  final String id;
  final String packageId;
  final String customer;
  final CarServiceModel carService;
  final VendorModel vendor;
  final List<ServiceProblemModel> serviceProblems;
  final String totalAmount;
  final int rating;
  final String comment;
  final bool read;
  final List<String> readVendor;
  final String packageNotAcceptedTime;
  final int position;
  final String createdAt;
  final String updatedAt;
  final OtherProblemModel othersProblem;
  final String packageRunningTime;
  const PackageModel({
    required this.id,
    required this.packageId,
    required this.customer,
    required this.carService,
    required this.vendor,
    required this.serviceProblems,
    required this.totalAmount,
    required this.rating,
    required this.comment,
    required this.read,
    required this.readVendor,
    required this.packageNotAcceptedTime,
    required this.position,
    required this.createdAt,
    required this.updatedAt,
    required this.othersProblem,
    required this.packageRunningTime,
  });

  PackageModel copyWith({
    String? id,
    String? packageId,
    String? customer,
    CarServiceModel? carService,
    VendorModel? vendor,
    List<ServiceProblemModel>? serviceProblem,
    String? totalAmount,
    int? rating,
    String? comment,
    bool? read,
    List<String>? readVendor,
    String? packageNotAcceptedTime,
    int? position,
    String? createdAt,
    String? updatedAt,
    OtherProblemModel? othersProblem,
    String? packageRunningTime,
  }) {
    return PackageModel(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
      customer: customer ?? this.customer,
      carService: carService ?? this.carService,
      vendor: vendor ?? this.vendor,
      serviceProblems: serviceProblem ?? serviceProblems,
      totalAmount: totalAmount ?? this.totalAmount,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      read: read ?? this.read,
      readVendor: readVendor ?? this.readVendor,
      packageNotAcceptedTime:
          packageNotAcceptedTime ?? this.packageNotAcceptedTime,
      position: position ?? this.position,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      othersProblem: othersProblem ?? this.othersProblem,
      packageRunningTime: packageRunningTime ?? this.packageRunningTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'packageId': packageId,
      'customer': customer,
      'carService': carService.toMap(),
      'vendor': vendor.toMap(),
      'serviceProblem': serviceProblems.map((x) => x.toMap()).toList(),
      'totalAmount': totalAmount,
      'rating': rating,
      'comment': comment,
      'read': read,
      'readVendor': readVendor,
      'packageNotAcceptedTime': packageNotAcceptedTime,
      'position': position,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'othersProblem': othersProblem.toMap(),
      'packageRunningTime': packageRunningTime,
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['_id'] ?? '',
      packageId: map['packageId'] ?? '',
      customer: map['customer'] ?? '',
      carService: CarServiceModel.fromMap(map['carService']),
      vendor: VendorModel.fromMap(map['vendor']),
      serviceProblems: List<ServiceProblemModel>.from(
          map['serviceProblem']?.map((x) => ServiceProblemModel.fromMap(x)) ??
              const []),
      totalAmount: map['totalAmount'] ?? '',
      rating: map['rating']?.toInt() ?? 0,
      comment: map['comment'] ?? '',
      read: map['read'] ?? false,
      readVendor: List<String>.from(map['readVendor'] ?? const []),
      packageNotAcceptedTime: map['packageNotAcceptedTime'] ?? '',
      position: map['position']?.toInt() ?? 0,
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      othersProblem: map['othersProblem'] == null
          ? OtherProblemModel.init()
          : OtherProblemModel.fromMap(map['othersProblem']),
      packageRunningTime: map['packageRunningTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageModel.fromJson(String source) =>
      PackageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PackageModel(id: $id, packageId: $packageId, customer: $customer, carService: $carService, vendor: $vendor, serviceProblem: $serviceProblems, totalAmount: $totalAmount, rating: $rating, comment: $comment, read: $read, readVendor: $readVendor, packageNotAcceptedTime: $packageNotAcceptedTime, position: $position, createdAt: $createdAt, updatedAt: $updatedAt, othersProblem: $othersProblem, packageRunningTime: $packageRunningTime)';
  }

  @override
  List<Object> get props {
    return [
      id,
      packageId,
      customer,
      carService,
      vendor,
      serviceProblems,
      totalAmount,
      rating,
      comment,
      read,
      readVendor,
      packageNotAcceptedTime,
      position,
      createdAt,
      updatedAt,
      othersProblem,
      packageRunningTime,
    ];
  }
}
