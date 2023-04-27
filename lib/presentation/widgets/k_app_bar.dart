import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/message/cusmoter_model.dart';
import 'widgets.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    Key? key,
    this.titleText,
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.titleTextStyle,
    this.centerTitle = false,
    this.bottom,
    this.backgroundColor = ColorPalate.white,
    this.elevation,
    this.scrolledUnderElevation,
  }) : super(key: key);

  final Widget? leading, title;
  final String? titleText;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? elevation;
  final double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? ColorPalate.white,
      foregroundColor: ColorPalate.black,
      leading: leading,
      title: title ??
          (titleText != null
              ? Text(
                  titleText!,
                  style: titleTextStyle ?? CustomTextStyle.textStyle16w600,
                )
              : null),
      actions: actions,
      bottom: bottom ?? const BottomBorder(),
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BottomBorder extends StatelessWidget implements PreferredSizeWidget {
  const BottomBorder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KDivider();
  }

  @override
  Size get preferredSize => const Size.fromHeight(1);
}

class KCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KCustomAppBar({
    Key? key,
    required this.model,
  }) : super(key: key);
  final CustomerInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const BackButton(),
            Container(
              width: 48.w,
              height: 32.h,
              padding: paddingH8,
              child: KCircleAvatar(
                imgUrl: model.profilePicture,
                radius: 16.r,
                enableBorder: true,
              ),
            ),
            gap10,
            Text(
              model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              // style: CustomTextStyle.textStyle16w600,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
