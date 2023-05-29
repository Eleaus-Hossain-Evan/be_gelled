import 'package:flutter/material.dart';

import '../../../domain/order/model/food_item_mode.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class PackageTile extends StatelessWidget {
  const PackageTile({
    super.key,
    required this.title,
    required this.titleCalorie,
    required this.items,
    this.onTap,
    this.border,
    this.backgroundColor,
    this.headTextStyle,
  });

  final String title;
  final String titleCalorie;
  final List<FoodItemModel> items;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor;
  final TextStyle? headTextStyle;

  @override
  Widget build(BuildContext context) {
    return KContainer(
      onTap: onTap,
      border: items.isEmpty ? Border() : border,
      backgroundColor: backgroundColor,
      padding: items.isEmpty ? padding0 : null,
      child: Column(
        children: [
          _tile(
            title: title,
            amount: titleCalorie,
            isHead: true,
            headTextStyle: headTextStyle,
            haveListItems: items.isEmpty,
          ),

          ...List.generate(items.length, (index) {
            final item = items[index];
            return _tile(
              title: item.name,
              amount: (item.caloriesPerHundredGram * item.quantity)
                  .toStringAsFixed(2),
            );
          }),
          // _tile(
          //   title: "Fish (Hilsha Fish)",
          //   price: "800 gm",
          // ),
          // gap4,
          // _tile(
          //   title: "Red Spinach",
          //   price: "200 gm",
          // ),
          // gap4,
          // _tile(
          //   title: "Sugar ",
          //   price: "500 gm",
          // ),
          // gap4,
          // _tile(
          //   title: "Chicken (Layer) ",
          //   price: "1 kg",
          // ),
        ],
      ),
    );
  }

  Widget _tile({
    required String title,
    required String amount,
    bool isHead = false,
    TextStyle? headTextStyle,
    bool haveListItems = false,
  }) {
    return Padding(
      padding: haveListItems
          ? padding0
          : isHead
              ? paddingBottom8
              : paddingBottom4,
      child: Row(
        mainAxisAlignment: mainSpaceBetween,
        children: [
          Text(
            title,
            style: isHead
                ? CustomTextStyle.textStyle14w600
                : CustomTextStyle.textStyle12w400HG800,
          ),
          Text(
            amount,
            style: isHead
                ? headTextStyle ??
                    CustomTextStyle.textStyle14w600Orange.copyWith(
                      color: haveListItems
                          ? ColorPalate.primary
                          : ColorPalate.secondary,
                    )
                : CustomTextStyle.textStyle12w500HG800,
          ),
        ],
      ),
    );
  }
}
