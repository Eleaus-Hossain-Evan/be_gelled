import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/package_model.dart';

class PackageListResponse extends Equatable {
  final List<PackageModel> data;
  final bool success;
  final String message;

  const PackageListResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  PackageListResponse copyWith({
    List<PackageModel>? data,
    bool? success,
    String? message,
  }) {
    return PackageListResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'success': success,
      'message': message,
    };
  }

  factory PackageListResponse.fromMap(Map<String, dynamic> map) {
    return PackageListResponse(
      data: List<PackageModel>.from(
          map['data']?.map((x) => PackageModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageListResponse.fromJson(String source) =>
      PackageListResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'OtherProblemAcceptedListResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
