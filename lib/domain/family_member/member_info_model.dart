import 'package:be_gelled/utils/utils.dart';
import 'package:equatable/equatable.dart';

enum Gender { male, female, other }

enum PhysicalActivity { hard, moderate, low }

class MemberInfoModel extends Equatable {
  final String name;
  final String nameBengali;
  final String phone;
  final double height;
  final int? weight;
  final Gender? gender;
  final PhysicalActivity? physicalActivity;
  final int age;
  final String dateOfBirth;
  final bool diabeticPatient;
  final double diabeticLevel;
  final bool kidneyPatient;
  final double kidneyLevel;
  final bool allergy;
  final String othersProblem;
  final String profilePicture;
  final bool isActive;
  final String parentAccount;
  final bool isDeleted;
  final String id;

  const MemberInfoModel({
    required this.name,
    required this.nameBengali,
    required this.phone,
    required this.height,
    required this.weight,
    required this.gender,
    required this.physicalActivity,
    required this.age,
    required this.dateOfBirth,
    required this.diabeticPatient,
    required this.diabeticLevel,
    required this.kidneyPatient,
    required this.kidneyLevel,
    required this.allergy,
    required this.othersProblem,
    required this.profilePicture,
    required this.isActive,
    required this.parentAccount,
    required this.isDeleted,
    required this.id,
  });

  factory MemberInfoModel.init() => const MemberInfoModel(
        name: "",
        nameBengali: '',
        phone: "",
        height: 0,
        weight: null,
        gender: null,
        physicalActivity: null,
        age: 0,
        dateOfBirth: "",
        diabeticPatient: false,
        diabeticLevel: 0,
        kidneyPatient: false,
        kidneyLevel: 0,
        allergy: false,
        othersProblem: "",
        isActive: false,
        isDeleted: false,
        parentAccount: "",
        profilePicture: "",
        id: '',
      );

  MemberInfoModel copyWith({
    String? name,
    String? nameBengali,
    String? phone,
    double? height,
    int? weight,
    Gender? gender,
    PhysicalActivity? physicalActivity,
    int? age,
    String? dateOfBirth,
    bool? diabeticPatient,
    double? diabeticLevel,
    bool? kidneyPatient,
    double? kidneyLevel,
    bool? allergy,
    String? othersProblem,
    String? profilePicture,
    bool? isActive,
    String? parentAccount,
    bool? isDeleted,
    String? id,
  }) {
    return MemberInfoModel(
      name: name ?? this.name,
      nameBengali: nameBengali ?? this.nameBengali,
      phone: phone ?? this.phone,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      physicalActivity: physicalActivity ?? this.physicalActivity,
      age: age ?? this.age,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      diabeticPatient: diabeticPatient ?? this.diabeticPatient,
      diabeticLevel: diabeticLevel ?? this.diabeticLevel,
      kidneyPatient: kidneyPatient ?? this.kidneyPatient,
      kidneyLevel: kidneyLevel ?? this.kidneyLevel,
      allergy: allergy ?? this.allergy,
      othersProblem: othersProblem ?? this.othersProblem,
      profilePicture: profilePicture ?? this.profilePicture,
      isActive: isActive ?? this.isActive,
      parentAccount: parentAccount ?? this.parentAccount,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nameBengali': nameBengali,
      'phone': phone,
      'height': height,
      'weight': weight,
      'gender': gender?.name,
      'physicalActivity': physicalActivity?.name,
      'age': age,
      'dateOfBirth': dateOfBirth,
      'diabeticPatient': diabeticPatient,
      'diabeticLevel': diabeticLevel,
      'kidneyPatient': kidneyPatient,
      'kidneyLevel': kidneyLevel,
      'allergy': allergy,
      'othersProblem': othersProblem,
      'profilePicture': profilePicture,
      'isActive': isActive,
      'parentAccount': parentAccount,
      'isDeleted': isDeleted,
      '_id': id,
    };
  }

  Map<String, dynamic> toMapAdd() {
    return {
      'name': name,
      'nameBengali': nameBengali,
      'phone': phone,
      'height': height,
      'weight': weight,
      'gender': gender?.name.toCapitalize(),
      'physicalActivity': physicalActivity?.index,
      'age': age,
      'dateOfBirth': dateOfBirth,
      'diabeticPatient': diabeticPatient,
      'diabeticLevel': diabeticLevel,
      'kidneyPatient': kidneyPatient,
      'kidneyLevel': kidneyLevel,
      'allergy': allergy,
      'othersProblem': othersProblem,
    };
  }

  factory MemberInfoModel.fromMap(Map<String, dynamic> map) {
    return MemberInfoModel(
      name: map['name'] ?? '',
      nameBengali: map['nameBengali'] ?? '',
      phone: map['phone'] ?? '',
      height: map['height']?.toDouble() ?? 0,
      weight: map['weight']?.toInt(),
      gender: map['gender'] != null
          ? Gender.values.byName(map['gender'].toLowerCase())
          : null,
      physicalActivity: map['physicalActivity'] != null
          ? PhysicalActivity.values[(map['physicalActivity']).toInt()]
          : null,
      age: map['age']?.toInt() ?? 0,
      dateOfBirth: map['dateOfBirth'] ?? '',
      diabeticPatient: map['diabeticPatient'] ?? false,
      diabeticLevel: map['diabeticLevel']?.toDouble() ?? 0.0,
      kidneyPatient: map['kidneyPatient'] ?? false,
      kidneyLevel: map['kidneyLevel']?.toDouble() ?? 0.0,
      allergy: map['allergy'] ?? false,
      othersProblem: map['othersProblem'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      isActive: map['isActive'] ?? false,
      parentAccount: map['parentAccount'] ?? '',
      isDeleted: map['isDeleted'] ?? false,
      id: map['_id'],
    );
  }

  @override
  String toString() {
    return 'MemberInfo(name: $name, nameBengali: $nameBengali, phone: $phone, height: $height, weight: $weight, gender: $gender, physicalActivity: $physicalActivity, age: $age, dateOfBirth: $dateOfBirth, diabeticPatient: $diabeticPatient, diabeticLevel: $diabeticLevel, kidneyPatient: $kidneyPatient, kidneyLevel: $kidneyLevel, allergy: $allergy, othersProblem: $othersProblem, profilePicture: $profilePicture, isActive: $isActive, parentAccount: $parentAccount, isDeleted: $isDeleted, id: $id)';
  }

  @override
  List<Object> get props {
    return [
      name,
      nameBengali,
      phone,
      height,
      weight ?? 0,
      gender?.name ?? '',
      physicalActivity?.name ?? '',
      age,
      dateOfBirth,
      diabeticPatient,
      diabeticLevel,
      kidneyPatient,
      kidneyLevel,
      allergy,
      othersProblem,
      profilePicture,
      isActive,
      parentAccount,
      isDeleted,
      id,
    ];
  }
}
