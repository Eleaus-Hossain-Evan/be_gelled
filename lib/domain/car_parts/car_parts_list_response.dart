import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/car_parts_model.dart';

class CarPartsListResponse extends Equatable {
  final List<CarPartsModel> data;
  final bool success;
  final String message;

  const CarPartsListResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  CarPartsListResponse copyWith({
    List<CarPartsModel>? data,
    bool? success,
    String? message,
  }) {
    return CarPartsListResponse(
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

  factory CarPartsListResponse.fromMap(Map<String, dynamic> map) {
    return CarPartsListResponse(
      data: List<CarPartsModel>.from(
          map['data']?.map((x) => CarPartsModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarPartsListResponse.fromJson(String source) =>
      CarPartsListResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CarPartsListResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
