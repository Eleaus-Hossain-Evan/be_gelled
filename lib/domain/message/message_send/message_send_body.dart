import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageSendBody extends Equatable {
  final String message;
  final String customerId;

  const MessageSendBody({
    required this.message,
    required this.customerId,
  });

  MessageSendBody copyWith({
    String? message,
    String? userId,
  }) {
    return MessageSendBody(
      message: message ?? this.message,
      customerId: userId ?? this.customerId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'customerId': customerId,
    };
  }

  factory MessageSendBody.fromMap(Map<String, dynamic> map) {
    return MessageSendBody(
      message: map['message'] ?? '',
      customerId: map['customerId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageSendBody.fromJson(String source) =>
      MessageSendBody.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessageSendBody(message: $message, customerId: $customerId)';

  @override
  List<Object> get props => [message, customerId];
}
