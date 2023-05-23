import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../package_model.dart';

class PackageTile extends StatelessWidget {
  const PackageTile({
    super.key,
    required this.model,
    this.onTap,
    this.border,
    this.backgroundColor,
    this.headTextStyle,
  });

  final PackageModel model;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor;
  final TextStyle? headTextStyle;

  @override
  Widget build(BuildContext context) {
    return KContainer(
      onTap: onTap,
      border: border,
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          _tile(
            title: model.name,
            amount: "৳ 1,200",
            isHead: true,
            headTextStyle: headTextStyle,
          ),

          ...List.generate(model.items.length, (index) {
            final item = model.items[index];
            return _tile(
              title: item.name,
              amount: item.amount.toWeightString(),
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
  }) {
    return Padding(
      padding: isHead ? paddingBottom8 : paddingBottom4,
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
                ? headTextStyle ?? CustomTextStyle.textStyle14w600Orange
                : CustomTextStyle.textStyle12w500HG800,
          ),
        ],
      ),
    );
  }
}
