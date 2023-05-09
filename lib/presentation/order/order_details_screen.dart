import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../home/home_screen.dart';
import '../widgets/widgets.dart';
import 'select_package_screen.dart';
import 'widgets/package_tile.dart';

enum DayChoice { days2, days3 }

class OrderDetailsScreen extends HookConsumerWidget {
  static const String route = '/order-details';
  const OrderDetailsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splitOrder = useState(true);

    final selectedDayChoice = useState(DayChoice.days2);

    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Order Details',
      ),
      body: SingleChildScrollView(
        padding: padding16,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              "Delivery Address",
              style: CustomTextStyle.textStyle16w600HG1000,
            ),
            gap16,
            Image.asset(
              Images.map,
              height: 98.h,
              width: 1.sw,
            ),
            gap8,
            Row(
              children: [
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Text(
                      "Home",
                      style: CustomTextStyle.textStyle14w600,
                    ),
                    gap4,
                    Text(
                      "House 15, Road 11, Nikunja 2 | 5th Floor (5B)",
                      style: CustomTextStyle.textStyle12w400HG800,
                    ),
                  ],
                ),
              ],
            ),
            gap24,
            KContainer(
              border: const Border(),
              backgroundColor: ColorPalate.white,
              boxShadow: [
                BoxShadow(
                  color: ColorPalate.harrisonGrey100.withOpacity(0.8),
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                ),
                BoxShadow(
                  color: ColorPalate.harrisonGrey100.withOpacity(0.8),
                  blurRadius: 10,
                  offset: const Offset(-1, -1),
                ),
              ],
              child: Row(
                mainAxisAlignment: mainSpaceBetween,
                children: [
                  Text(
                    "Delivery Time",
                    style: CustomTextStyle.textStyle16w600HG1000,
                  ),
                  Text(
                    "ASAP (40 Min)",
                    style: CustomTextStyle.textStyle14w500Primary,
                  )
                ],
              ),
            ),
            gap24,
            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                Text(
                  "Items List",
                  style: CustomTextStyle.textStyle16w600HG1000,
                ),
                Text(
                  "Update ",
                  style: CustomTextStyle.textStyle12w600Secondary,
                )
              ],
            ),
            gap16,
            PackageTile(
              model: packageList[3],
              border: const Border(),
              backgroundColor: const Color(0xFFF9F9FA),
              headTextStyle: CustomTextStyle.textStyle18w600HG1000,
            ),
            gap18,
            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Split Order",
                      style: CustomTextStyle.textStyle16w600HG1000,
                    ),
                    gap8,
                    Image.asset(
                      Images.iconInfo,
                      height: 16.h,
                      width: 16.w,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      splitOrder.value ? "ON" : "OFF",
                      style: CustomTextStyle.textStyle12w600HG1000,
                    ),
                    SizedBox(
                      height: 13.h,
                      width: 21.w,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Switch(
                          value: splitOrder.value,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            splitOrder.value = value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gap18,
            Text(
              "Select your choose package",
              style: CustomTextStyle.textStyle16w500HG1000,
            ),
            gap6,
            Row(
              children: List.generate(
                DayChoice.values.length,
                (index) => Row(
                  children: [
                    Radio<DayChoice>(
                      value: DayChoice.values[index],
                      groupValue: selectedDayChoice.value,
                      visualDensity: VisualDensity.compact,
                      onChanged: (value) {
                        selectedDayChoice.value = value!;
                      },
                    ),
                    AnimatedDefaultTextStyle(
                      style: selectedDayChoice.value == DayChoice.values[index]
                          ? CustomTextStyle.textStyle14w500HG1000
                          : CustomTextStyle.textStyle14w500HG800,
                      duration: kThemeAnimationDuration,
                      child: Text(
                        index == 0 ? "2 days (৳ 600)" : "3 days (৳ 400)",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gap16,
            KContainer(
              border: const Border(),
              backgroundColor: const Color(0xFFF9F9FA),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      Text(
                        "Subtotal:",
                        style: CustomTextStyle.textStyle14w400.copyWith(
                          color: const Color(0xff40444E),
                        ),
                      ),
                      Text(
                        "৳ 600",
                        style: CustomTextStyle.textStyle14w400.copyWith(
                          color: const Color(0xff40444E),
                        ),
                      ),
                    ],
                  ),
                  gap8,
                  Row(
                    mainAxisAlignment: mainSpaceBetween,
                    children: [
                      Text(
                        "Delivery Fee:",
                        style: CustomTextStyle.textStyle14w400.copyWith(
                          color: const Color(0xff40444E),
                        ),
                      ),
                      Text(
                        "৳ 0",
                        style: CustomTextStyle.textStyle14w400.copyWith(
                          color: const Color(0xff40444E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gap24,
            const KDivider(color: ColorPalate.harrisonGrey100),
            gap16,
            Row(
              mainAxisAlignment: mainSpaceBetween,
              children: [
                Text(
                  "Total",
                  style: CustomTextStyle.textStyle14w600,
                ),
                Text(
                  "৳ 600",
                  style: CustomTextStyle.textStyle16w600Orange,
                ),
              ],
            ),
            gap16,
            FilledButton(
              onPressed: () {
                ref
                    .read(familyProvider.notifier)
                    .update((state) => state = false);
                context.pop();
                Navigator.pop(context);
                context.pop();
              },
              child: const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}
