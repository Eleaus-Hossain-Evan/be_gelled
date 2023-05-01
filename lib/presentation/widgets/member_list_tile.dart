import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../application/family_member/family_member_provider.dart';
import '../../domain/family_member/member_info_model.dart';
import '../../utils/utils.dart';
import '../family_member/member_info_screen.dart';
import 'widgets.dart';

class MemberListTile extends HookConsumerWidget {
  const MemberListTile({
    super.key,
    required this.index,
    required this.memberInfo,
  });

  final int index;
  final MemberInfo memberInfo;

  @override
  Widget build(BuildContext context, ref) {
    final isComplete = useState(false);

    useMemoized(() {
      isComplete.value = memberInfo.fullName.isNotEmpty &&
          memberInfo.dateOfBirth.isNotEmpty &&
          memberInfo.gender != null;
    }, [ref.watch(familyMemberProvider).members[index]]);
    return KContainer(
      backgroundColor:
          isComplete.value ? const Color(0x142ec28d) : ColorPalate.white,
      onTap: () {
        // context.push("${MemberInfoScreen.route}/$index");
        showBarModalBottomSheet(
          context: context,
          backgroundColor: ColorPalate.white,
          barrierColor: ColorPalate.primary.withOpacity(0.64),
          isDismissible: true,
          useRootNavigator: true,
          builder: (context) {
            return MemberInfoScreen(memberIndex: index);
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: mainStart,
            mainAxisSize: mainMin,
            crossAxisAlignment: crossStart,
            children: [
              Text(
                memberInfo.fullName.isEmpty
                    ? "Member 0$index"
                    : memberInfo.fullName,
                style: CustomTextStyle.textStyle14w600,
              ),
              gap10,
              Row(
                mainAxisAlignment: mainStart,
                mainAxisSize: mainMin,
                children: [
                  Image.asset(
                    isComplete.value
                        ? Images.iconCheckMarkCircle
                        : Images.iconWarning,
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.cover,
                  ),
                  gap10,
                  Text(
                    isComplete.value
                        ? "Profile completed"
                        : "Please provide informations",
                    style: CustomTextStyle.textStyle14w400HG900,
                  ),
                ],
              )
            ],
          ),
          Image.asset(
            Images.iconArrowRight,
            width: 24.w,
            height: 24.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
