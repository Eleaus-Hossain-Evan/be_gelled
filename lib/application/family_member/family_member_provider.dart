import 'package:be_gelled/application/global.dart';
import 'package:be_gelled/infrastructure/family_member_repo.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/family_member/member_info_model.dart';
import '../auth/auth_provider.dart';
import 'family_member_state.dart';

final familyMemberProvider =
    StateNotifierProvider<FamilyMemberNotifier, FamilyMemberState>((ref) {
  return FamilyMemberNotifier(ref, FamilyMemberRepo());
}, name: "familyMemberProvider");

class FamilyMemberNotifier extends StateNotifier<FamilyMemberState> {
  final Ref ref;
  final FamilyMemberRepo repo;
  FamilyMemberNotifier(this.ref, this.repo) : super(FamilyMemberState.init());

  void setMember(int parse) {
    final user = ref.watch(authProvider).user;
    final newList =
        List.generate(parse, (index) => MemberInfoModel.init()).toIList();

    state = state.copyWith(
      member: parse,
      members: newList.replace(
        0,
        MemberInfoModel.init().copyWith(
          name: user.name,
          nameBengali: user.nameInArabic,
          id: user.id,
          phone: user.phone,
        ),
      ),
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

  Future<bool> saveMemberInfo(MemberInfoModel model, int index) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.addFamilyMember(model);

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(
          loading: false,
          failure: l,
        );
      },
      (r) {
        success = true;
        return state = state.copyWith(
          loading: false,
          members: state.members.replace(index, r),
        );
      },
    );

    return success;
  }
}
