import 'dart:developer';

import 'package:be_gelled/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home/home_screen.dart';
import '../widgets/widgets.dart';

class VendorListScreen extends HookConsumerWidget {
  static const route = "/vendor_list";
  const VendorListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = useState<int?>(null);
    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Select Vendors',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              context.local.vendorsAreAvailableToHelpYou(4),
              style: CustomTextStyle.textStyle16w600,
            ),
            KListViewSeparated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => VendorTile(
                isSelected: isSelected.value == index,
                onTap: () => isSelected.value = index,
              ),
              itemCount: 4,
              separator: gap16,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 32.h),
        child: FilledButton(
          onPressed: isSelected.value != null
              ? () {
                  context.pop();
                  context.pop();
                  // if (ref.watch(familyMemberProvider).members.isNotEmpty) {
                  //   Navigator.pop(context);
                  // }
                  ref.read(familyProvider.notifier).update((state) => true);
                }
              : null,
          child: Text(context.local.continueText),
        ),
      ),
    );
  }
}

class VendorTile extends StatelessWidget {
  const VendorTile({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        log("long press");
        showAppModal(
          context: context,
          builder: (context) => Material(
            child: SizedBox(
              height: .5.sh,
              child: SingleChildScrollView(
                // controller: controller,
                child: Column(
                  mainAxisAlignment: mainStart,
                  crossAxisAlignment: crossStart,
                  children: [
                    Image.asset(
                      Images.map,
                      height: .2.sh,
                      fit: BoxFit.cover,
                    ),
                    const KDivider(),
                    Padding(
                      padding: padding16,
                      child: Column(
                        mainAxisAlignment: mainStart,
                        crossAxisAlignment: crossStart,
                        children: [
                          Text(
                            "Rabbani General Store",
                            style: CustomTextStyle.textStyle16w600,
                          ),
                          gap12,
                          Text(
                            "Location: H 90, Rd 12, Sector 16, Utta...",
                            style: CustomTextStyle.textStyle14w500HG800,
                          ),
                          gap6,
                          Row(
                            children: [
                              Image.asset(
                                Images.iconStar,
                                height: 16.w,
                                width: 16.w,
                                fit: BoxFit.cover,
                              ),
                              gap6,
                              Text(
                                "4.1",
                                style: CustomTextStyle.textStyle14w600,
                              ),
                              gap6,
                              Text(
                                "(750)",
                                style: CustomTextStyle.textStyle14w400,
                              ),
                            ],
                          ),
                          gap6,
                          Row(
                            children: [
                              Image.asset(
                                Images.iconUsers,
                                height: 20.w,
                                width: 20.w,
                                fit: BoxFit.cover,
                              ),
                              gap4,
                              Text(
                                "999",
                                style: CustomTextStyle.textStyle14w600Orange,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: KContainer(
        onTap: onTap,
        backgroundColor: isSelected
            ? ColorPalate.secondary.withOpacity(.06)
            : ColorPalate.white,
        border: Border.all(
          color: isSelected ? ColorPalate.secondary : Colors.transparent,
        ),
        child: Row(
          children: [
            Image.asset(
              Images.aciLogo,
              height: 48.w,
              width: 48.w,
              fit: BoxFit.cover,
            ),
            gap12,
            Flexible(
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Rabbani General Store",
                          style: CustomTextStyle.textStyle14w600,
                        ),
                      ),
                      Image.asset(
                        Images.iconUsers,
                        height: 20.w,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                      gap4,
                      Text(
                        "999",
                        style: CustomTextStyle.textStyle14w600Orange,
                      ),
                    ],
                  ),
                  gap6,
                  Row(
                    children: [
                      Image.asset(
                        Images.iconStar,
                        height: 16.w,
                        width: 16.w,
                        fit: BoxFit.cover,
                      ),
                      gap6,
                      Text(
                        "4.1",
                        style: CustomTextStyle.textStyle14w600,
                      ),
                      gap6,
                      Text(
                        "(750)",
                        style: CustomTextStyle.textStyle14w400,
                      ),
                    ],
                  ),
                  gap6,
                  Row(
                    children: [
                      Image.asset(
                        Images.iconLocation,
                        height: 16.w,
                        width: 16.w,
                        fit: BoxFit.cover,
                      ),
                      gap10,
                      Text(
                        "H 90, Rd 12, Sector 16, Utta...",
                        style: CustomTextStyle.textStyle14w500HG800,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
