import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../vendor/model/problem_model.dart';

class ServiceProblemModel extends Equatable {
  final String id;
  final ProblemModel problem;
  final String amount;
  final String time;

  const ServiceProblemModel({
    required this.id,
    required this.problem,
    required this.amount,
    required this.time,
  });

  factory ServiceProblemModel.init() {
    return ServiceProblemModel(
      id: '',
      problem: ProblemModel.init(),
      amount: '',
      time: '',
    );
  }

  ServiceProblemModel copyWith({
    String? id,
    ProblemModel? problem,
    String? amount,
    String? time,
  }) {
    return ServiceProblemModel(
      id: id ?? this.id,
      problem: problem ?? this.problem,
      amount: amount ?? this.amount,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'problem': problem.toMap(),
      'amount': amount,
      'time': time,
    };
  }

  factory ServiceProblemModel.fromMap(Map<String, dynamic> map) {
    return ServiceProblemModel(
      id: map['_id'] ?? '',
      problem: map['problem'] == null
          ? ProblemModel.init()
          : ProblemModel.fromMap(map['problem']),
      amount: map['amount'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProblemModel.fromJson(String source) =>
      ServiceProblemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceProblemModel(id: $id, problem: $problem, amount: $amount, time: $time)';
  }

  @override
  List<Object> get props => [id, problem, amount, time];
}
