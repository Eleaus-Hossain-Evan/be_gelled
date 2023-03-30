import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/service_problem_model.dart';

class ServiceProblemAllResponse extends Equatable {
  final List<ServiceProblemModel> data;
  final bool success;
  final String message;

  const ServiceProblemAllResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  factory ServiceProblemAllResponse.init() => const ServiceProblemAllResponse(
        data: [],
        success: false,
        message: '',
      );

  ServiceProblemAllResponse copyWith({
    List<ServiceProblemModel>? data,
    bool? success,
    String? message,
  }) {
    return ServiceProblemAllResponse(
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

  factory ServiceProblemAllResponse.fromMap(Map<String, dynamic> map) {
    return ServiceProblemAllResponse(
      data: List<ServiceProblemModel>.from(
          map['data']?.map((x) => ServiceProblemModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProblemAllResponse.fromJson(String source) =>
      ServiceProblemAllResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'ServiceProblemAllResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
