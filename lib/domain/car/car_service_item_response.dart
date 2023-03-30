import 'dart:convert';

import 'package:equatable/equatable.dart';

class CarServiceItemResponse extends Equatable {
  final List<String> data;
  final bool success;
  final String message;

  const CarServiceItemResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  CarServiceItemResponse copyWith({
    List<String>? data,
    bool? success,
    String? message,
  }) {
    return CarServiceItemResponse(
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

  factory CarServiceItemResponse.fromMap(Map<String, dynamic> map) {
    return CarServiceItemResponse(
      data: List<String>.from(map['data'] ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarServiceItemResponse.fromJson(String source) =>
      CarServiceItemResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CarServiceResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
