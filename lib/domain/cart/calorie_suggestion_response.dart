import 'package:equatable/equatable.dart';

import 'model/calorie_model.dart';

class CalorieSuggestionResponse extends Equatable {
  final CalorieModel data;
  final bool success;
  final String message;

  const CalorieSuggestionResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  CalorieSuggestionResponse copyWith({
    CalorieModel? data,
    bool? success,
    String? message,
  }) {
    return CalorieSuggestionResponse(
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

  factory CalorieSuggestionResponse.fromMap(Map<String, dynamic> map) {
    return CalorieSuggestionResponse(
      data: CalorieModel.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  @override
  String toString() =>
      'CalorieSuggestionResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
