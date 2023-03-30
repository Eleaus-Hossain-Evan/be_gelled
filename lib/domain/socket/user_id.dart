import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserId extends Equatable {
  final String userId;

  const UserId({
    required this.userId,
  });

  UserId copyWith({
    String? userId,
  }) {
    return UserId(
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
    };
  }

  factory UserId.fromMap(Map<String, dynamic> map) {
    return UserId(
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserId.fromJson(String source) => UserId.fromMap(json.decode(source));

  @override
  String toString() => 'UserId(userId: $userId)';

  @override
  List<Object> get props => [userId];
}
