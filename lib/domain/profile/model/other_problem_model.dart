import 'dart:convert';

import 'package:equatable/equatable.dart';

class OtherProblemModel extends Equatable {
  final String id;
  final String othersProblem;
  final String amount;
  final int position;
  const OtherProblemModel({
    required this.id,
    required this.othersProblem,
    required this.amount,
    required this.position,
  });

  factory OtherProblemModel.init() {
    return const OtherProblemModel(
      id: '',
      othersProblem: '',
      amount: '',
      position: 0,
    );
  }

  OtherProblemModel copyWith({
    String? id,
    String? othersProblem,
    String? amount,
    int? position,
  }) {
    return OtherProblemModel(
      id: id ?? this.id,
      othersProblem: othersProblem ?? this.othersProblem,
      amount: amount ?? this.amount,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'othersProblem': othersProblem,
      'amount': amount,
      'position': position,
    };
  }

  factory OtherProblemModel.fromMap(Map<String, dynamic> map) {
    return OtherProblemModel(
      id: map['_id'] ?? '',
      othersProblem: map['othersProblem'] ?? '',
      amount: map['amount'] ?? '',
      position: map['position']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherProblemModel.fromJson(String source) =>
      OtherProblemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OthersProblem(_id: $id, othersProblem: $othersProblem, amount: $amount, position: $position)';
  }

  @override
  List<Object> get props => [id, othersProblem, amount, position];
}
