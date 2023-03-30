// // ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../vendor/model/vendor_model.dart';

class HomeData extends Equatable {
  final List<VendorModel> vendor;
  final List<String> sliders;

  const HomeData({
    required this.vendor,
    required this.sliders,
  });

  factory HomeData.init() => const HomeData(
        vendor: [],
        sliders: [],
      );

  HomeData copyWith({
    List<VendorModel>? vendor,
    List<String>? sliders,
  }) {
    return HomeData(
      vendor: vendor ?? this.vendor,
      sliders: sliders ?? this.sliders,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'vendor': vendor.map((x) => x.toMap()).toList(),
      'sliders': sliders,
    };
  }

  factory HomeData.fromMap(Map<String, dynamic> map) {
    return HomeData(
      vendor: List<VendorModel>.from(
          map['vendor']?.map((x) => VendorModel.fromMap(x)) ?? const []),
      sliders: List<String>.from(map['sliders'] ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeData.fromJson(String source) =>
      HomeData.fromMap(json.decode(source));

  @override
  String toString() => 'HomeData(vendor: $vendor, sliders: $sliders)';

  @override
  List<Object> get props => [vendor, sliders];
}
