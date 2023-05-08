import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import 'widgets.dart';

class KContainer extends StatelessWidget {
  const KContainer(
      {Key? key,
      required this.child,
      this.padding,
      this.margin,
      this.backgroundColor,
      this.width,
      this.height,
      this.borderRadius,
      this.border,
      this.onTap,
      this.boxShadow})
      : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding, margin;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double? width, height;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: onTap,
      borderRadius: borderRadius ?? radius8,
      child: Container(
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
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
