import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class ContentOptions extends StatelessWidget {
  const ContentOptions({
    super.key,
    required this.header,
    required this.imagePath,
    required this.title,
    this.titleTextStyle,
    this.subtitle,
    this.onTap,
    this.subTitleTextStyle,
  });

  final String header;
  final String imagePath;
  final String title;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Text(
          header,
          style: CustomTextStyle.textStyle16w600HG1000,
        ),
        gap16,
        KContainer(
          // height: 80.h,
          onTap: onTap,
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 48.w,
                height: 48.w,
                fit: BoxFit.cover,
              ),
              gap12,
              Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    title,
                    style:
                        titleTextStyle ?? CustomTextStyle.textStyle16w400HG1000,
                  ),
                  subtitle == null
                      ? const SizedBox.shrink()
                      : Text(
                          subtitle!,
                          style: subTitleTextStyle ??
                              CustomTextStyle.textStyle14w400HG800,
                        ),
                ],
              ),
              const Spacer(),
              Image.asset(
                Images.iconArrowRight,
                width: 24.w,
                height: 24.w,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
