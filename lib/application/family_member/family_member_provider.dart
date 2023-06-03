import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/family_member/member_info_model.dart';
import 'family_member_state.dart';

final familyMemberProvider =
    StateNotifierProvider<FamilyMemberNotifier, FamilyMemberState>((ref) {
  return FamilyMemberNotifier(ref);
}, name: "familyMemberProvider");

class FamilyMemberNotifier extends StateNotifier<FamilyMemberState> {
  final Ref ref;
  FamilyMemberNotifier(this.ref) : super(FamilyMemberState.init());

  void setMember(int parse) {
    final newList =
        List.generate(parse, (index) => MemberInfoModel.init()).toIList();
    newList.replace(0, MemberInfoModel.init().copyWith(name: "Rabbani"));
    state = state.copyWith(
      member: parse,
      members: newList,
    );
  }

  void addMember() {
    state = state.copyWith(
      member: state.member + 1,
      members: state.members.add(MemberInfoModel.init()),
    );
  }

  void setMemberInfo(MemberInfoModel memberInfo, int index) {
    state = state.copyWith(
      members: state.members.replace(index, memberInfo),
    );
  }

  void saveMemberInfo() {
    state = state.copyWith(loading: true);
  }
}
