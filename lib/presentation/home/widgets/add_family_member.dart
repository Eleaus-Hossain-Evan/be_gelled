import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/family_member/family_member_provider.dart';
import '../../../utils/utils.dart';
import '../../family_member/member_list_screen.dart';
import '../../widgets/widgets.dart';

class AddFamilyMember extends HookConsumerWidget {
  const AddFamilyMember();

  @override
  Widget build(BuildContext context, ref) {
    final memberController = useTextEditingController(text: '0');
    final node = useFocusNode();
    return Container(
      color: ColorPalate.white,
      padding: padding16,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(32.h),
            Image.asset(
              Images.familyMember,
              width: 96.w,
              height: 96.w,
              fit: BoxFit.cover,
            ),
            gap16,
            Text(
              context.local.familyMembers,
              style: CustomTextStyle.textStyle30w700.copyWith(
                letterSpacing: -.2,
              ),
            ),
            gap4,
            Text(
              context.local.howManyFamilyMembers,
              style: CustomTextStyle.textStyle16w400HG900.copyWith(
                color: const Color(0xFF44344D),
              ),
            ),
            gap32,
            KTextFormField(
              controller: memberController,
              focusNode: node,
              labelText: context.local.familyMembers,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            gap24,
            ValueListenableBuilder(
              valueListenable: memberController,
              builder: (context, value, child) {
                return KFilledButton(
                  onPressed: value.text.isEmpty || value.text == '0'
                      ? null
                      : () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          ref.read(familyMemberProvider.notifier).setMember(
                                int.parse(value.text),
                              );
                          context.push(MemberListScreen.route);
                        },
                  text: context.local.continueText,
                );
              },
            ),
            gap32,
          ],
        ),
      ),
    );
  }
}
