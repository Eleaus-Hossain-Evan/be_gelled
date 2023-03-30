import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'problem_model.dart';

class ProblemInfoModel extends Equatable {
  final String id;
  final ProblemModel problem;
  final String amount;
  final bool isAdminCreated;

  const ProblemInfoModel({
    required this.problem,
    required this.amount,
    required this.isAdminCreated,
    required this.id,
  });

  factory ProblemInfoModel.init() {
    return ProblemInfoModel(
      problem: ProblemModel.init(),
      amount: '',
      isAdminCreated: false,
      id: '',
    );
  }

  ProblemInfoModel copyWith({
    ProblemModel? problem,
    String? amount,
    bool? isAdminCreated,
    String? id,
  }) {
    return ProblemInfoModel(
      problem: problem ?? this.problem,
      amount: amount ?? this.amount,
      isAdminCreated: isAdminCreated ?? this.isAdminCreated,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'problem': problem.toMap(),
      'amount': amount,
      'isAdminCreated': isAdminCreated,
      '_id': id,
    };
  }

  factory ProblemInfoModel.fromMap(Map<String, dynamic> map) {
    return ProblemInfoModel(
      problem: ProblemModel.fromMap(map['problem']),
      amount: map['amount'] ?? '',
      isAdminCreated: map['isAdminCreated'] ?? false,
      id: map['_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemInfoModel.fromJson(String source) =>
      ProblemInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProblemInfo(problem: $problem, amount: $amount, isAdminCreated: $isAdminCreated, _id: $id)';
  }

  @override
  List<Object> get props => [problem, amount, isAdminCreated, id];
}
