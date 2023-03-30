import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/other_problem_unaccepted.dart';

class OtherProblemUnAcceptedListResponse extends Equatable {
  final List<NotificationModel> data;
  final bool success;
  final String message;

  const OtherProblemUnAcceptedListResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  OtherProblemUnAcceptedListResponse copyWith({
    List<NotificationModel>? data,
    bool? success,
    String? message,
  }) {
    return OtherProblemUnAcceptedListResponse(
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

  factory OtherProblemUnAcceptedListResponse.fromMap(Map<String, dynamic> map) {
    return OtherProblemUnAcceptedListResponse(
      data: List<NotificationModel>.from(
          map['data']?.map((x) => NotificationModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherProblemUnAcceptedListResponse.fromJson(String source) =>
      OtherProblemUnAcceptedListResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'OtherProblemUnAcceptedListResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
