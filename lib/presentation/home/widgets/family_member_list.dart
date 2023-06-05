import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/family_member/family_member_provider.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class FamilyMemberListWidget extends HookConsumerWidget {
  const FamilyMemberListWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(familyMemberProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: mainSpaceBetween,
          children: [
            Text(
              context.local.familyMembers,
              style: CustomTextStyle.textStyle16w600,
            ),
            Text(
              context.local.addMembers,
              style: CustomTextStyle.textStyle16w600Orange,
            ),
          ],
        ),
        KListViewSeparated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => MemberListTile(
            index: index,
            memberInfo: state.members[index],
          ),
          itemCount: state.members.length,
          separator: gap16,
        ),
        gap32,
      ],
    );
  }
}
