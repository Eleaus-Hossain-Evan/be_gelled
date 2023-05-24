import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return KAppBar(
      title: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            children: [
              Image.asset(
                Images.iconLocation,
                // width: 32.w,
                height: 22.w,
                fit: BoxFit.scaleDown,
              ),
              gap10,
              Text(context.local.home, style: CustomTextStyle.textStyle16w600),
            ],
          ),
          Padding(
            padding: paddingLeft28,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Road 2, Sector 10, Uttara",
                      style: CustomTextStyle.textStyle16w400HG900),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.top,
                    child: InkWell(
                      onTap: () {
                        log("Road 2, Sector 10, Uttara");
                      },
                      child: Image.asset(
                        Images.iconArrowDown,
                        width: 16.w,
                        height: 16.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Badge(
            backgroundColor: ColorPalate.orange,
            isLabelVisible: true,
            child: Icon(
              Icons.notifications,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
