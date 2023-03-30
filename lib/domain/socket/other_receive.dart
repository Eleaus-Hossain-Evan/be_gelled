import 'dart:convert';

import 'package:equatable/equatable.dart';

class OtherReceive extends Equatable {
  final String othersProblem;
  final String receiverId;

  const OtherReceive({
    required this.othersProblem,
    required this.receiverId,
  });

  OtherReceive copyWith({
    String? othersProblem,
    String? receiverId,
  }) {
    return OtherReceive(
      othersProblem: othersProblem ?? this.othersProblem,
      receiverId: receiverId ?? this.receiverId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'othersProblem': othersProblem,
      'receiverId': receiverId,
    };
  }

  factory OtherReceive.fromMap(Map<String, dynamic> map) {
    return OtherReceive(
      othersProblem: map['othersProblem'] ?? '',
      receiverId: map['receiverId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherReceive.fromJson(String source) =>
      OtherReceive.fromMap(json.decode(source));

  @override
  String toString() =>
      'OtherReceive(othersProblem: $othersProblem, receiverId: $receiverId)';

  @override
  List<Object> get props => [othersProblem, receiverId];
}
