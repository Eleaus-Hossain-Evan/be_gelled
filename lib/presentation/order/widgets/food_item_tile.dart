import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';

class FoodItemTile extends HookConsumerWidget {
  const FoodItemTile({
    super.key,
    required this.title,
    required this.amount,
    required this.increment,
    required this.decrement,
  });

  final String title;
  final double amount;
  final VoidCallback? increment;
  final VoidCallback? decrement;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: paddingBottom24,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: CustomTextStyle.textStyle14w500HG1000,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                SizedBox(
                  height: 32.w,
                  width: 32.w,
                  child: FilledButton(
                    onPressed: decrement,
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorPalate.primary,
                      foregroundColor: ColorPalate.white,
                      disabledBackgroundColor: ColorPalate.white,
                      disabledForegroundColor: ColorPalate.black,
                      padding: padding0,
                      shape: RoundedRectangleBorder(
                        borderRadius: radius8,
                      ),
                      side: const BorderSide(
                        color: ColorPalate.spaceScape100,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 18.w,
                    ),
                  ),
                ),
                Text(
                  "${amount}",
                  style: CustomTextStyle.textStyle14w500HG1000,
                ),
                SizedBox(
                  height: 32.w,
                  width: 32.w,
                  child: FilledButton(
                    onPressed: increment,
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorPalate.primary,
                      foregroundColor: ColorPalate.white,
                      disabledBackgroundColor: ColorPalate.white,
                      disabledForegroundColor: ColorPalate.black,
                      padding: padding0,
                      shape: RoundedRectangleBorder(
                        borderRadius: radius8,
                      ),
                      side: const BorderSide(
                        color: ColorPalate.spaceScape100,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 18.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
