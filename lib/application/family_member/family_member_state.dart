import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/family_member/member_info_model.dart';

class FamilyMemberState extends Equatable {
  final bool loading;
  final int member;
  final IList<MemberInfoModel> members;

  const FamilyMemberState({
    required this.loading,
    required this.member,
    required this.members,
  });

  factory FamilyMemberState.init() {
    return const FamilyMemberState(
      loading: false,
      member: 1,
      members: IListConst([]),
    );
  }

  FamilyMemberState copyWith({
    bool? loading,
    int? member,
    IList<MemberInfoModel>? members,
  }) {
    return FamilyMemberState(
      loading: loading ?? this.loading,
      member: member ?? this.member,
      members: members ?? this.members,
    );
  }

  @override
  String toString() =>
      'FamilyMemberState(loading: $loading, member: $member, members: $members)';

  @override
  List<Object> get props => [loading, member, members];
}
