import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_palate.dart';

class CustomTextStyle {
  CustomTextStyle._();

  static TextStyle smallPrimaryTextStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.primary,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle12w600Secondary = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
    letterSpacing: .8,
  );

  static TextStyle textStyle10w600Secondary = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle8w600 = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
  );
}
