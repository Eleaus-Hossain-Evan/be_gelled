import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palate.dart';

class CustomTextStyle {
  CustomTextStyle._();

  static TextStyle textStyle30w700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    color: ColorPalate.harrisonGrey1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle18w500HG1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle18w500Red = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.error,
  );

  static TextStyle textStyle16w600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static TextStyle textStyle16w600White = textStyle16w600.copyWith(
    color: ColorPalate.white,
  );

  static TextStyle textStyle16w600Orange = textStyle16w600.copyWith(
    color: ColorPalate.orange,
  );

  static TextStyle textStyle16w600HG900 = textStyle16w600.copyWith(
    color: ColorPalate.harrisonGrey900,
    letterSpacing: 0,
  );

  static TextStyle textStyle16w600HG1000 = textStyle16w600.copyWith(
    color: ColorPalate.harrisonGrey1000,
  );

  static TextStyle textStyle16w500HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle16w400HG900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle16w400Orange = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.orange,
  );

  static TextStyle textStyle14w500HG900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey900,
  );

  static TextStyle textStyle14w600Orange = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.orange,
  );

  static TextStyle textStyle14w500HG800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.harrisonGrey800,
  );

  static TextStyle textStyle14w500Red = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.error,
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
