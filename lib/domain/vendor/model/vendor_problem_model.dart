import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'problem_info.dart';
import 'vendor_model.dart';

class VendorProblemModel extends Equatable {
  final String id;
  final List<ProblemInfoModel> problemInfo;
  final VendorModel vendor;
  final int problemSolveAbility;
  final int problemSolveAmount;

  const VendorProblemModel({
    required this.id,
    required this.problemInfo,
    required this.vendor,
    required this.problemSolveAbility,
    required this.problemSolveAmount,
  });

  factory VendorProblemModel.init() {
    return VendorProblemModel(
      id: '',
      problemInfo: const [],
      vendor: VendorModel.init(),
      problemSolveAbility: 0,
      problemSolveAmount: 0,
    );
  }

  VendorProblemModel copyWith({
    String? id,
    List<ProblemInfoModel>? problemInfo,
    VendorModel? vendor,
    int? problemSolveAbility,
    int? problemSolveAmount,
  }) {
    return VendorProblemModel(
      id: id ?? this.id,
      problemInfo: problemInfo ?? this.problemInfo,
      vendor: vendor ?? this.vendor,
      problemSolveAbility: problemSolveAbility ?? this.problemSolveAbility,
      problemSolveAmount: problemSolveAmount ?? this.problemSolveAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'problemInfo': problemInfo.map((x) => x.toMap()).toList(),
      'vendor': vendor.toMap(),
      'problemSolveAbility': problemSolveAbility,
      'problemSolveAmount': problemSolveAmount,
    };
  }

  factory VendorProblemModel.fromMap(Map<String, dynamic> map) {
    return VendorProblemModel(
      id: map['_id'] ?? '',
      problemInfo: List<ProblemInfoModel>.from(
          map['problemInfo']?.map((x) => ProblemInfoModel.fromMap(x)) ??
              const []),
      vendor: VendorModel.fromMap(map['vendor']),
      problemSolveAbility: map['problemSolveAbility']?.toInt() ?? 0,
      problemSolveAmount: map['problemSolveAmount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorProblemModel.fromJson(String source) =>
      VendorProblemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(_id: $id, problemInfo: $problemInfo, vendor: $vendor, problemSolveAbility: $problemSolveAbility, problemSolveAmount: $problemSolveAmount)';
  }

  @override
  List<Object> get props {
    return [
      id,
      problemInfo,
      vendor,
      problemSolveAbility,
      problemSolveAmount,
    ];
  }
}
