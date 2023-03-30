import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/car_service_model.dart';

class CarServiceResponse extends Equatable {
  final CarServiceModel data;
  final bool success;
  final String message;

  const CarServiceResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  CarServiceResponse copyWith({
    CarServiceModel? data,
    bool? success,
    String? message,
  }) {
    return CarServiceResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'success': success,
      'message': message,
    };
  }

  factory CarServiceResponse.fromMap(Map<String, dynamic> map) {
    return CarServiceResponse(
      data: CarServiceModel.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarServiceResponse.fromJson(String source) =>
      CarServiceResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CarServiceResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
