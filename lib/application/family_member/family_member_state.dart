import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:be_gelled/utils/network_util/network_failure.dart';

import '../../domain/family_member/member_info_model.dart';

class FamilyMemberState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final int member;
  final IList<MemberInfoModel> members;

  const FamilyMemberState({
    required this.loading,
    required this.failure,
    required this.member,
    required this.members,
  });

  factory FamilyMemberState.init() {
    return FamilyMemberState(
      loading: false,
      failure: CleanFailure.none(),
      member: 1,
      members: const IListConst([]),
    );
  }

  FamilyMemberState copyWith({
    bool? loading,
    CleanFailure? failure,
    int? member,
    IList<MemberInfoModel>? members,
  }) {
    return FamilyMemberState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      member: member ?? this.member,
      members: members ?? this.members,
    );
  }

  @override
  String toString() {
    return 'FamilyMemberState(loading: $loading, failure: $failure, member: $member, members: $members)';
  }

  @override
  List<Object> get props => [loading, failure, member, members];
}
