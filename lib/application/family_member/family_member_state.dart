import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/family_member/member_info_model.dart';

class FamilyMemberState extends Equatable {
  final int member;
  final IList<MemberInfo> members;

  const FamilyMemberState({
    required this.member,
    required this.members,
  });

  factory FamilyMemberState.init() {
    return const FamilyMemberState(
      member: 1,
      members: IListConst([]),
    );
  }

  FamilyMemberState copyWith({
    int? member,
    IList<MemberInfo>? members,
  }) {
    return FamilyMemberState(
      member: member ?? this.member,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'member': member,
      'members': members.map((x) => x.toMap()).toList(),
    };
  }

  factory FamilyMemberState.fromMap(Map<String, dynamic> map) {
    return FamilyMemberState(
      member: map['member']?.toInt() ?? 0,
      members: List<MemberInfo>.from(
              map['members']?.map((x) => MemberInfo.fromMap(x)) ?? const [])
          .lock,
    );
  }

  String toJson() => json.encode(toMap());

  factory FamilyMemberState.fromJson(String source) =>
      FamilyMemberState.fromMap(json.decode(source));

  @override
  String toString() => 'AddMemberState(member: $member, members: $members)';

  @override
  List<Object> get props => [member, members];
}
