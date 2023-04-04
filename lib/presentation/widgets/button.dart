// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';

class KButton extends HookConsumerWidget {
  const KButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.splashColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.elevation,
    this.hoverElevation,
    this.focusElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.child,
    this.padding,
    this.shape,
    this.minWidth,
    this.height,
    this.loading,
    this.text,
    this.textStyle,
    this.borderColor,
    this.borderWidth,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHighlightChanged;
  final ButtonTextTheme? textTheme;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? color;
  final Color? disabledColor;
  final Color? splashColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final double? elevation;
  final double? hoverElevation;
  final double? focusElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final Widget? child;
  bool get enabled => onPressed != null || onLongPress != null;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final double? minWidth;
  final double? height;
  final bool? loading;
  final String? text;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      textTheme: textTheme ?? context.theme.buttonTheme.textTheme,
      disabledTextColor: disabledTextColor,
      height: 54.h,
      minWidth: double.infinity,
      color: color ?? context.color.primary,
      textColor: textColor ?? context.color.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: borderColor ?? color ?? context.color.primary,
          width: borderWidth ?? 0,
        ),
      ),
      splashColor: splashColor,
      elevation: elevation,
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? context.color.onPrimary,
                ),
                strokeWidth: 3,
              ),
            )
          : child ?? Text(text ?? "", style: textStyle),
    );
  }
}

class KFilledButton extends KButton {
  final VoidCallback? onPressed;
  final String text;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  final bool isSecondary;
  final bool? loading;

  KFilledButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isSecondary = false,
    this.loading,
    this.child,
    this.color,
    this.textColor,
    this.borderColor,
  }) : super(
          key: key,
          onPressed: onPressed,
          text: text,
          textStyle: CustomTextStyle.textStyle16w600White.copyWith(
            letterSpacing: 0.15,
          ),
          textTheme: ButtonTextTheme.normal,
          child: child,
          color: color,
          textColor: textColor,
          borderColor: color,
          borderWidth: 0,
          loading: loading,
          splashColor: ColorPalate.primary.brighten(10),
        );
}

class KOutlinedButton extends KButton {
  final VoidCallback? onPressed;
  final String text;
  final Widget? child;
  final Color? textColor;
  final Color? borderColor;

  final bool isSecondary;
  final bool? loading;

  KOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isSecondary = false,
    this.loading,
    this.child,
    this.textColor = ColorPalate.harrisonGrey1000,
    this.borderColor = ColorPalate.harrisonGrey1000,
  }) : super(
          key: key,
          onPressed: onPressed,
          text: text,
          textStyle: CustomTextStyle.textStyle16w600HG1000
              .copyWith(letterSpacing: 0.15),
          textTheme: ButtonTextTheme.normal,
          child: child,
          color: ColorPalate.white,
          textColor: textColor,
          borderColor: textColor,
          borderWidth: 1,
          elevation: 0,
          loading: loading,
        );
}

// class KIconElevatedButton extends HookConsumerWidget {
//   const KIconElevatedButton({
//     Key? key,
//     required this.onPressed,
//     required this.text,
//     required this.icon,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.loading = false,
//   }) : super(key: key);

//   final String text;
//   final Widget icon;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final VoidCallback onPressed;
//   final bool? loading;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         minimumSize: MaterialStateProperty.all(Size.fromHeight(55.h)),
//         backgroundColor: MaterialStateProperty.all(backgroundColor),
//         foregroundColor: MaterialStateProperty.all(foregroundColor),
//       ),
//       onPressed: onPressed,
//       child: (loading != null && loading!)
//           ? SizedBox(
//               height: 30.h,
//               width: 30.h,
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   foregroundColor ?? Theme.of(context).colorScheme.secondary,
//                 ),
//               ),
//             )
//           : Row(
//               children: [
//                 Expanded(child: Center(child: Text(text))),
//                 Material(
//                   elevation: 4,
//                   color: backgroundColor ?? Theme.of(context).primaryColor,
//                   borderRadius: BorderRadius.circular(100.r),
//                   child: Padding(
//                     padding: EdgeInsets.all(6.w),
//                     child: icon,
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

// class KElevatedButton extends HookConsumerWidget {
//   const KElevatedButton({
//     Key? key,
//     required this.onPressed,
//     required this.text,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.loading,
//     this.child,
//     this.isSecondary = false,
//     this.textStyle,
//     this.size,
//   }) : super(key: key);

//   final String text;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final VoidCallback? onPressed;
//   final bool? loading;
//   final Widget? child;
//   final bool isSecondary;
//   final TextStyle? textStyle;
//   final Size? size;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(55.h)),
//         textStyle: MaterialStateProperty.all(textStyle),
//         backgroundColor: MaterialStateProperty.resolveWith<Color>(
//             (Set<MaterialState> states) {
//           if (states.contains(MaterialState.disabled)) {
//             return context.theme.disabledColor;
//           }
//           return backgroundColor ??
//               (isSecondary ? context.color.secondary : context.color.primary);
//         }),
//         foregroundColor: MaterialStateProperty.all(foregroundColor),
//         overlayColor: MaterialStateProperty.all(
//           isSecondary ? context.color.secondary : context.color.primary,
//         ),
//       ),
//       onPressed: onPressed,
//       child: (loading != null && loading!)
//           ? SizedBox(
//               height: 30.h,
//               width: 30.h,
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   isSecondary
//                       ? context.color.onSecondaryContainer
//                       : context.color.onPrimaryContainer,
//                 ),
//               ),
//             )
//           : child ??
//               Text(
//                 text,
//               ),
//     );
//   }
// }

// class KOutlinedButton extends HookConsumerWidget {
//   const KOutlinedButton({
//     Key? key,
//     required this.onPressed,
//     required this.text,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.loading,
//     this.textStyle,
//     this.borderColor,
//     this.size,
//     this.isSecondary = true,
//   }) : super(key: key);

//   final String text;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final Color? borderColor;
//   final VoidCallback? onPressed;
//   final ValueNotifier<bool>? loading;
//   final TextStyle? textStyle;
//   final Size? size;
//   final bool isSecondary;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return OutlinedButton(
//       style: ButtonStyle(
//         minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(48.h)),
//         backgroundColor: MaterialStateProperty.all(backgroundColor),
//         foregroundColor: MaterialStateProperty.all(foregroundColor),
//         side: MaterialStateProperty.all(
//           BorderSide(
//             color: borderColor ??
//                 (isSecondary
//                     ? Theme.of(context).colorScheme.secondary
//                     : Theme.of(context).colorScheme.primary),
//           ),
//         ),
//         overlayColor: MaterialStateProperty.all(
//           (isSecondary
//               ? Theme.of(context).colorScheme.secondary.withOpacity(.1)
//               : Theme.of(context).colorScheme.primary.withOpacity(.1)),
//         ),
//       ),
//       onPressed: onPressed,
//       child: (loading != null && loading!.value)
//           ? SizedBox(
//               height: 30.h,
//               width: 30.h,
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   foregroundColor ?? Theme.of(context).colorScheme.secondary,
//                 ),
//               ),
//             )
//           : Text(
//               text,
//               style: TextStyle(
//                 color: isSecondary
//                     ? Theme.of(context).colorScheme.secondary
//                     : Theme.of(context).colorScheme.primary,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 12.sp,
//                 letterSpacing: 1.50,
//                 fontFamily: "Open Sans",
//               ),
//             ),
//     );
//   }
// }


