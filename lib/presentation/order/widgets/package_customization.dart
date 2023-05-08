import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';
import '../order_details_screen.dart';
import '../package_model.dart';

class PackageCustomization extends HookConsumerWidget {
  const PackageCustomization({
    super.key,
    required this.model,
  });

  final PackageModel model;

  @override
  Widget build(BuildContext context, ref) {
    final items = useState(model.items);
    return Padding(
      padding: padding16,
      child: Column(
        crossAxisAlignment: crossStart,
        mainAxisSize: mainMin,
        children: [
          gap20,
          Text(
            model.name,
            style: CustomTextStyle.textStyle24w700,
          ),
          gap24,
          ...List.generate(
            items.value.length,
            (index) {
              final item = items.value[index];
              return _tile(
                title: item.name,
                amount: item.amount,
                increment: () {},
                decrement: index < 3 ? null : () {},
              );
            },
          ),
          Gap(40.h),
          Row(
            mainAxisAlignment: mainSpaceBetween,
            children: [
              Text(
                "Subtotal",
                style: CustomTextStyle.textStyle14w600,
              ),
              Text(
                "৳ 1,200",
                style: CustomTextStyle.textStyle16w600Orange,
              ),
            ],
          ),
          gap16,
          FilledButton(
            onPressed: () {
              context.push(OrderDetailsScreen.route);
            },
            child: Text(context.local.continueText),
          ),
        ],
      ),
    );
  }

  Widget _tile({
    required String title,
    required double amount,
    required VoidCallback? increment,
    required VoidCallback? decrement,
  }) {
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
                  amount.toWeightString(),
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
