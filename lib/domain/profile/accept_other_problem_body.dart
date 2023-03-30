import 'dart:convert';

import 'package:equatable/equatable.dart';

class AcceptOtherProblemBody extends Equatable {
  final String id;
  final String vendor;
  final String amount;
  final String time;

  const AcceptOtherProblemBody({
    required this.id,
    required this.vendor,
    required this.amount,
    required this.time,
  });

  AcceptOtherProblemBody copyWith({
    String? id,
    String? vendor,
    String? amount,
    String? time,
  }) {
    return AcceptOtherProblemBody(
      id: id ?? this.id,
      vendor: vendor ?? this.vendor,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vendor': vendor,
      'amount': amount,
      'time': time,
    };
  }

  factory AcceptOtherProblemBody.fromMap(Map<String, dynamic> map) {
    return AcceptOtherProblemBody(
      id: map['id'] ?? '',
      vendor: map['vendor'] ?? '',
      amount: map['amount'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AcceptOtherProblemBody.fromJson(String source) =>
      AcceptOtherProblemBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AcceptOtherProblemBody(id: $id, vendor: $vendor, amount: $amount, time: $time)';
  }

  @override
  List<Object> get props => [id, vendor, amount, time];
}
