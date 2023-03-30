import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/car_service_model.dart';

class CarServiceListResponse extends Equatable {
  final List<CarServiceModel> data;
  final bool success;
  final String message;

  const CarServiceListResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  CarServiceListResponse copyWith({
    List<CarServiceModel>? data,
    bool? success,
    String? message,
  }) {
    return CarServiceListResponse(
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

  factory CarServiceListResponse.fromMap(Map<String, dynamic> map) {
    return CarServiceListResponse(
      data: List<CarServiceModel>.from(
          map['data']?.map((x) => CarServiceModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarServiceListResponse.fromJson(String source) =>
      CarServiceListResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CarServiceResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
