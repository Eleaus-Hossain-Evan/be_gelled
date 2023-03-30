import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/my_bids_model.dart';

class MyBidsResponse extends Equatable {
  final List<MyBidsModel> data;
  final bool success;
  final String message;
  const MyBidsResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  MyBidsResponse copyWith({
    List<MyBidsModel>? data,
    bool? success,
    String? message,
  }) {
    return MyBidsResponse(
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

  factory MyBidsResponse.fromMap(Map<String, dynamic> map) {
    return MyBidsResponse(
      data: List<MyBidsModel>.from(
          map['data']?.map((x) => MyBidsModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyBidsResponse.fromJson(String source) =>
      MyBidsResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MyBidsResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
