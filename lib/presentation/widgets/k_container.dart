import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';

class KContainer extends StatelessWidget {
  const KContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final double? width, height;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding:
          padding ?? EdgeInsetsDirectional.fromSTEB(16.w, 16.h, 16.w, 16.h),
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? radius8,
        border: border ??
            Border.all(
              color: ColorPalate.harrisonGrey100,
            ),
      ),
      child: child,
    );
  }
}
