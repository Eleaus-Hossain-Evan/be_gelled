import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/message/cusmoter_model.dart';
import 'widgets.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    Key? key,
    required this.titleText,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.titleTextStyle,
    this.centerTitle = true,
    this.bottom,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  final Widget? leading;
  final String titleText;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: ColorPalate.black,
      leading: leading,
      title: Text(titleText, style: titleTextStyle
          // ?? CustomTextStyle.textStyle16w600,
          ),
      actions: actions,
      bottom: bottom,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
