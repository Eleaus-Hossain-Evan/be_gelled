import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_palate.dart';

class CustomTextStyle {
  CustomTextStyle._();

  static TextStyle textStyle30w700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    color: ColorPalate.harrisonGrey1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle16w600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyle16w600White =
      textStyle16w600.copyWith(color: ColorPalate.white);

  static TextStyle textStyle16w600HG1000 =
      textStyle16w600.copyWith(color: ColorPalate.harrisonGrey1000);

  static TextStyle smallPrimaryTextStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.primary,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle16w400HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle10w600Secondary = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle8w600White = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
  );
}
