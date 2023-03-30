import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_palate.dart';

class BottomRoundedContainer extends StatelessWidget {
  const BottomRoundedContainer({
    Key? key,
    required this.child,
    this.height,
    this.backgroundColor = ColorPalate.white1,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.sw,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: child,
    );
  }
}
