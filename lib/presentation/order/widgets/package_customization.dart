import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';
import '../order_details_screen.dart';
import '../../../domain/cart/model/package_model.dart';
import 'food_item_tile.dart';

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
              return FoodItemTile(
                title: item.name,
                amount: 0.0,
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
}
