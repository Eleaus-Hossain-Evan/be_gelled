import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyBidsModel extends Equatable {
  final String id;
  final String partsInfo;
  final int bidingAmount;
  final String bidingStatus;
  final String bidingTime;
  const MyBidsModel({
    required this.id,
    required this.partsInfo,
    required this.bidingAmount,
    required this.bidingStatus,
    required this.bidingTime,
  });

  factory MyBidsModel.init() {
    return const MyBidsModel(
      id: '',
      partsInfo: '',
      bidingAmount: 0,
      bidingStatus: '',
      bidingTime: '',
    );
  }

  MyBidsModel copyWith({
    String? id,
    String? partsInfo,
    int? bidingAmount,
    String? bidingStatus,
    String? bidingTime,
  }) {
    return MyBidsModel(
      id: id ?? this.id,
      partsInfo: partsInfo ?? this.partsInfo,
      bidingAmount: bidingAmount ?? this.bidingAmount,
      bidingStatus: bidingStatus ?? this.bidingStatus,
      bidingTime: bidingTime ?? this.bidingTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'partsInfo': partsInfo,
      'bidingAmount': bidingAmount,
      'bidingStatus': bidingStatus,
      'bidingTime': bidingTime,
    };
  }

  factory MyBidsModel.fromMap(Map<String, dynamic> map) {
    return MyBidsModel(
      id: map['_id'] ?? '',
      partsInfo: map['partsInfo'] ?? '',
      bidingAmount: map['bidingAmount']?.toInt() ?? 0,
      bidingStatus: map['bidingStatus'] ?? '',
      bidingTime: map['bidingTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyBidsModel.fromJson(String source) =>
      MyBidsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(_id: $id, partsInfo: $partsInfo, bidingAmount: $bidingAmount, bidingStatus: $bidingStatus, bidingTime: $bidingTime)';
  }

  @override
  List<Object> get props {
    return [
      id,
      partsInfo,
      bidingAmount,
      bidingStatus,
      bidingTime,
    ];
  }
}
