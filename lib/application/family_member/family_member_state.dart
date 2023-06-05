import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:be_gelled/utils/network_util/network_failure.dart';

import '../../domain/family_member/member_info_model.dart';

class FamilyMemberState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<MemberInfoModel> members;

  const FamilyMemberState({
    required this.loading,
    required this.failure,
    required this.members,
  });

  factory FamilyMemberState.init() {
    return FamilyMemberState(
      loading: false,
      failure: CleanFailure.none(),
      members: const IListConst([]),
    );
  }

  FamilyMemberState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<MemberInfoModel>? members,
  }) {
    return FamilyMemberState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      members: members ?? this.members,
    );
  }

  @override
  String toString() =>
      'FamilyMemberState(loading: $loading, failure: $failure, members: $members)';

  @override
  List<Object> get props => [loading, failure, members];
}
