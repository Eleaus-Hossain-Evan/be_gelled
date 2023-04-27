import 'package:be_gelled/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class MemberInfoScreen extends HookConsumerWidget {
  static const route = "/member_info";
  const MemberInfoScreen({super.key, required this.memberIndex});

  final int memberIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KAppBar(),
      body: SingleChildScrollView(
        padding: padding16,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              'Member 0$memberIndex',
              style: CustomTextStyle.textStyle24w700,
            ),
            Gap(48.h),
            Text(
              "Personal Information",
              style: CustomTextStyle.textStyle16w600HG1000,
            ),
            gap24,
            Container(
              color: Colors.amber,
              height: 64.h,
              child: KTextFormField2(l: "Full Name"),
            )
          ],
        ),
      ),
    );
  }
}
