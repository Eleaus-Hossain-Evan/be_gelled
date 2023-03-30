import 'dart:convert';

import 'package:equatable/equatable.dart';

class VendorViewResponse extends Equatable {
  final List<String> data;
  final bool success;
  final String message;

  const VendorViewResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  VendorViewResponse copyWith({
    List<String>? data,
    bool? success,
    String? message,
  }) {
    return VendorViewResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'success': success,
      'message': message,
    };
  }

  factory VendorViewResponse.fromMap(Map<String, dynamic> map) {
    return VendorViewResponse(
      data: List<String>.from(map['data'] ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorViewResponse.fromJson(String source) =>
      VendorViewResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'VendorViewAllResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
