import 'package:equatable/equatable.dart';

enum Gender { male, female, other }

enum PhysicalActivity { hard, moderate, low }

class MemberInfo extends Equatable {
  final String name;
  final String nameBengali;
  final String phone;
  final int height;
  final int? weight;
  final PhysicalActivity? physicalActivity;
  final Gender? gender;
  final String dateOfBirth;
  final double diabetic;
  final double kidney;
  final bool allergy;
  final String otherPhysicalProblem;

  const MemberInfo({
    required this.name,
    required this.nameBengali,
    required this.phone,
    required this.height,
    required this.weight,
    required this.physicalActivity,
    required this.gender,
    required this.dateOfBirth,
    required this.diabetic,
    required this.kidney,
    required this.allergy,
    required this.otherPhysicalProblem,
  });

  factory MemberInfo.init() => const MemberInfo(
        name: "",
        height: 0,
        phone: "",
        nameBengali: '',
        physicalActivity: null,
        weight: null,
        gender: null,
        dateOfBirth: "",
        diabetic: 0,
        kidney: 0,
        allergy: false,
        otherPhysicalProblem: "",
      );

  MemberInfo copyWith({
    String? name,
    String? nameBengali,
    String? phone,
    int? height,
    int? weight,
    PhysicalActivity? physicalActivity,
    Gender? gender,
    String? dateOfBirth,
    double? diabetic,
    double? kidney,
    bool? allergy,
    String? otherPhysicalProblem,
  }) {
    return MemberInfo(
      name: name ?? this.name,
      nameBengali: nameBengali ?? this.nameBengali,
      phone: phone ?? this.phone,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      physicalActivity: physicalActivity ?? this.physicalActivity,
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
      'name': name,
      'nameBengali': nameBengali,
      'phone': phone,
      'height': height,
      'weight': weight ?? 0,
      'physicalActivity': physicalActivity?.name,
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
      name: map['name'] ?? '',
      nameBengali: map['nameBengali'] ?? '',
      phone: map['phone'] ?? '',
      height: map['height']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
      physicalActivity: map['physicalActivity'] != null
          ? PhysicalActivity.values.byName(map['physicalActivity'])
          : null,
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
    return 'MemberInfo(name: $name, nameBengali: $nameBengali, phone: $phone, height: $height, weight: $weight, physicalActivity: $physicalActivity, gender: $gender, dateOfBirth: $dateOfBirth, diabetic: $diabetic, kidney: $kidney, allergy: $allergy, otherPhysicalProblem: $otherPhysicalProblem)';
  }

  @override
  List<Object> get props {
    return [
      name,
      nameBengali,
      phone,
      height,
      weight ?? 0,
      physicalActivity?.name ?? '',
      gender?.name ?? '',
      dateOfBirth,
      diabetic,
      kidney,
      allergy,
      otherPhysicalProblem,
    ];
  }
}
