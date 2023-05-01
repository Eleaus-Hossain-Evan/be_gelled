import 'package:equatable/equatable.dart';

enum Gender { male, female, other }

class MemberInfo extends Equatable {
  final String fullName;
  final Gender? gender;
  final String dateOfBirth;
  final double diabetic;
  final double kidney;
  final bool allergy;
  final String otherPhysicalProblem;

  const MemberInfo({
    required this.fullName,
    required this.gender,
    required this.dateOfBirth,
    required this.diabetic,
    required this.kidney,
    required this.allergy,
    required this.otherPhysicalProblem,
  });

  factory MemberInfo.init() => const MemberInfo(
        fullName: "",
        gender: null,
        dateOfBirth: "",
        diabetic: 0,
        kidney: 0,
        allergy: false,
        otherPhysicalProblem: "",
      );

  MemberInfo copyWith({
    String? fullName,
    Gender? gender,
    String? dateOfBirth,
    double? diabetic,
    double? kidney,
    bool? allergy,
    String? otherPhysicalProblem,
  }) {
    return MemberInfo(
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      diabetic: diabetic ?? this.diabetic,
      kidney: kidney ?? this.kidney,
      allergy: allergy ?? this.allergy,
      otherPhysicalProblem: otherPhysicalProblem ?? this.otherPhysicalProblem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'gender': gender?.name,
      'dateOfBirth': dateOfBirth,
      'diabetic': diabetic,
      'kidney': kidney,
      'allergy': allergy,
      'otherPhysicalProblem': otherPhysicalProblem,
    };
  }

  factory MemberInfo.fromMap(Map<String, dynamic> map) {
    return MemberInfo(
      fullName: map['fullName'] ?? '',
      gender:
          map['gender'] != null ? Gender.values.byName(map['gender']) : null,
      dateOfBirth: map['dateOfBirth'] ?? '',
      diabetic: map['diabetic']?.toDouble() ?? 0.0,
      kidney: map['kidney']?.toDouble() ?? 0.0,
      allergy: map['allergy'] ?? false,
      otherPhysicalProblem: map['otherPhysicalProblem'] ?? '',
    );
  }

  @override
  String toString() {
    return 'MemberInfo(fullName: $fullName, gender: $gender, dateOfBirth: $dateOfBirth, diabetic: $diabetic, kidney: $kidney, allergy: $allergy, otherPhysicalProblem: $otherPhysicalProblem)';
  }

  @override
  List<Object> get props {
    return [
      fullName,
      gender ?? "",
      dateOfBirth,
      diabetic,
      kidney,
      allergy,
      otherPhysicalProblem,
    ];
  }
}
