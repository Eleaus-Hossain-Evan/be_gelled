import 'package:be_gelled/utils/ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditAddress extends HookConsumerWidget {
  const EditAddress({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: .5.sh,
      child: Column(
        mainAxisSize: mainMin,
        children: [
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
