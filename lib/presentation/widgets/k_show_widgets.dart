import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utils/utils.dart';

showCustomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) =>
    showBarModalBottomSheet(
      context: context,
      backgroundColor: ColorPalate.white,
      barrierColor: ColorPalate.primary.withOpacity(0.64),
      builder: builder,
    );

/// Modal which is styled for the Flutter News Example app.
Future<T?> showAppModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  RouteSettings? routeSettings,
  BoxConstraints? constraints,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color? barrierColor,
  Color? backgroundColor,
  bool isDismissible = true,
  bool expand = false,
  AnimationController? secondAnimation,
  Curve? animationCurve,
  bool enableDrag = true,
  Widget? topControl,
  Duration? duration,
  SystemUiOverlayStyle? overlayStyle,
  double? closeProgressThreshold,
}) {
  return showBarModalBottomSheet(
    context: context,
    builder: builder,
    settings: routeSettings,
    expand: expand,
    barrierColor: barrierColor ?? ColorPalate.primary.withOpacity(0.64),
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    secondAnimation: secondAnimation,
    animationCurve: animationCurve,
    elevation: elevation,
    backgroundColor: backgroundColor ?? ColorPalate.white,
    shape: shape,
    clipBehavior: clipBehavior,
    overlayStyle: overlayStyle,
    closeProgressThreshold: closeProgressThreshold,
    topControl: topControl,
    duration: duration,
  );
}

Future<void> ensureVisibleOnTextArea({required GlobalKey textfieldKey}) async {
  final keyContext = textfieldKey.currentContext;
  if (keyContext != null) {
    await Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
      ),
    );
  }
}
