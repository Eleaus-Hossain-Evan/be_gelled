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
    state = state.copyWith(
      member: parse,
      members: List.filled(
        parse,
        MemberInfo.init(),
      ),
    );
  }
}
