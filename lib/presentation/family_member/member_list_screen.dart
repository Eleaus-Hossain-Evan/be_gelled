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
import 'vendor_list_screen.dart';

class MemberListScreen extends HookConsumerWidget {
  static const route = "/member_list";
  const MemberListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(familyMemberProvider).member;

    return Scaffold(
      appBar: KAppBar(
        leading: BackButton(
          onPressed: () {
            context.go(HomeScreen.route);
            ref.invalidate(familyMemberProvider);
          },
        ),
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
                itemBuilder: (context, index) => MemberListTile(
                  index: index,
                  memberInfo: ref.watch(familyMemberProvider).members[index],
                ),
                itemCount: member,
                separator: gap16,
              ),
              gap32,
              OutlinedButton.icon(
                onPressed: () =>
                    ref.read(familyMemberProvider.notifier).addMember(),
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
            // context.pop();
            // Navigator.pop(context);
            // Navigator.pop(context);

            context.push(VendorListScreen.route);
          },
          child: Text(context.local.continueText),
        ),
      ),
    );
  }
}
