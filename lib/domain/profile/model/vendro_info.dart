import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../vendor/model/vendor_model.dart';

class VendorInfo extends Equatable {
  final VendorModel vendor;
  final String amount;
  final String time;
  const VendorInfo({
    required this.vendor,
    required this.amount,
    required this.time,
  });

  VendorInfo copyWith({
    VendorModel? vendor,
    String? amount,
    String? time,
  }) {
    return VendorInfo(
      vendor: vendor ?? this.vendor,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vendor': vendor.toMap(),
      'amount': amount,
      'time': time,
    };
  }

  factory VendorInfo.fromMap(Map<String, dynamic> map) {
    return VendorInfo(
      vendor: VendorModel.fromMap(map['vendor']),
      amount: map['amount'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorInfo.fromJson(String source) =>
      VendorInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'VendorInfo(vendor: $vendor, amount: $amount, time: $time)';

  @override
  List<Object> get props => [vendor, amount, time];
}
