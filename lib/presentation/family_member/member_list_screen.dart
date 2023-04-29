import 'package:be_gelled/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/family_member/family_member_provider.dart';
import '../../domain/family_member/member_info_model.dart';
import '../home/home_screen.dart';
import '../widgets/widgets.dart';
import 'member_info_screen.dart';

class MemberListScreen extends HookConsumerWidget {
  static const route = "/member_list";
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(familyMemberProvider).member;

    useEffect(() {
      return () => ref.invalidate(familyMemberProvider);
    }, const []);
    return Scaffold(
      appBar: KAppBar(
        titleText: context.local.membersInformations,
        backgroundColor: ColorPalate.white,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          padding: padding16,
          child: Column(
            children: [
              KListViewSeparated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _MemberListTile(
                  index: index,
                  memberInfo: ref.watch(familyMemberProvider).members[index],
                ),
                itemCount: member,
                separator: gap16,
              ),
              gap32,
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: ColorPalate.primary,
                  ),
                ),
                label: Text(context.local.addMoreMember),
                icon: Image.asset(
                  Images.iconPlus,
                  width: 24.w,
                  height: 24.w,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(86.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(
          bottom: 32.h,
          top: 8.h,
        ),
        child: FilledButton(
          onPressed: () {
            ref.read(familyProvider.notifier).update((state) => true);
          },
          child: Text(context.local.continueText),
        ),
      ),
    );
  }
}

class _MemberListTile extends HookWidget {
  const _MemberListTile({
    required this.index,
    required this.memberInfo,
  });

  final int index;
  final MemberInfo memberInfo;

  @override
  Widget build(BuildContext context) {
    final isComplete = useState(
        (memberInfo.fullName == MemberInfo.init().fullName ||
                memberInfo.dateOfBirth == MemberInfo.init().dateOfBirth ||
                memberInfo.allergy == MemberInfo.init().allergy ||
                memberInfo.diabetic == MemberInfo.init().diabetic ||
                memberInfo.kidney == MemberInfo.init().kidney)
            ? false
            : true);
    return KContainer(
      backgroundColor:
          isComplete.value ? const Color(0x142ec28d) : ColorPalate.white,
      onTap: () {
        context.push("${MemberInfoScreen.route}/$index");
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
