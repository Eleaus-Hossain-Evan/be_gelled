import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/vendor_problem_model.dart';

class VendorProblemResponse extends Equatable {
  final List<VendorProblemModel> data;
  final bool success;
  final String message;

  const VendorProblemResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  VendorProblemResponse copyWith({
    List<VendorProblemModel>? data,
    bool? success,
    String? message,
  }) {
    return VendorProblemResponse(
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

  factory VendorProblemResponse.fromMap(Map<String, dynamic> map) {
    return VendorProblemResponse(
      data: List<VendorProblemModel>.from(
          map['data']?.map((x) => VendorProblemModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorProblemResponse.fromJson(String source) =>
      VendorProblemResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'VendorProblemResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
