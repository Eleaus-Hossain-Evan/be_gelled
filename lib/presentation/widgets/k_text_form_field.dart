import 'package:flutter/services.dart';

import '../../utils/custom_style.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/color_palate.dart';
import '../../utils/ui_constant.dart';

import 'k_inkwell.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    Key? key,
    required TextEditingController controller,
    required this.focusNode,
    this.hintText,
    required this.labelText,
    this.hintStyle,
    this.readOnly = false,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.error = false,
    this.inputFormatters,
  })  : _controller = controller,
        super(key: key);

  final String? hintText;
  final String labelText;
  final TextStyle? hintStyle;
  final TextEditingController _controller;
  final bool readOnly, error;
  final FocusNode focusNode;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context, ref) {
    final border = OutlineInputBorder(
      borderRadius: radius8,
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final hasFocus = useState(false);
    final showCursor = useState(false);

    void focusListener() {
      hasFocus.value = focusNode.hasFocus;
      showCursor.value = focusNode.hasPrimaryFocus;
    }

    useEffect(() {
      focusNode.addListener(focusListener);

      return () => focusNode.removeListener(focusListener);
    }, []);

    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Container(
        height: 64.h,
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color:
              hasFocus.value ? Colors.transparent : ColorPalate.spaceScape100,
          borderRadius: radius8,
          border: error
              ? Border.all(
                  color: ColorPalate.error,
                  width: 1,
                )
              : hasFocus.value
                  ? Border.all(
                      color: ColorPalate.harrisonGrey1000,
                      width: 1,
                    )
                  : Border.all(
                      color: ColorPalate.spaceScape100,
                      width: 1,
                    ),
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          mainAxisSize: mainMin,
          mainAxisAlignment: mainSpaceBetween,
          children: [
            Text(
              labelText,
              style: error
                  ? CustomTextStyle.textStyle14w500Red
                  : CustomTextStyle.textStyle14w500HG800.copyWith(height: 1.2),
            ),
            TextFormField(
              style: error
                  ? CustomTextStyle.textStyle18w500Red
                  : CustomTextStyle.textStyle18w500HG1000
                      .copyWith(height: 1.45),
              controller: _controller,
              keyboardType: keyboardType,
              validator: validator,
              readOnly: readOnly,
              maxLines: maxLines,
              // showCursor: hasFocus.value,
              cursorColor: ColorPalate.harrisonGrey1000,
              focusNode: focusNode,
              onChanged: onChanged,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onFieldSubmitted: onFieldSubmitted,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: 20.h),
                // hintStyle:
                //     CustomTextStyle.textStyle18w500HG1000.copyWith(height: 1),
                // labelStyle:
                //     CustomTextStyle.textStyle18w500HG1000.copyWith(height: 1),
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                errorBorder: border,
                disabledBorder: border,
                filled: false,
                fillColor: Colors.cyan,
                prefixIcon: prefixIcon,
                prefixIconConstraints: BoxConstraints(maxHeight: 40.h),
                suffixIconConstraints: BoxConstraints(maxHeight: 40.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KTextFormField2 extends HookConsumerWidget {
  const KTextFormField2({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.readOnly = false,
    this.enabled = true,
    this.onTap,
    this.prefixIcon,
    this.validator,
    required this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.contentPadding,
    this.fillColor = ColorPalate.spaceScape100,
    this.borderColor = Colors.transparent,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final bool readOnly, isObscure, enabled;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final Color fillColor, borderColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
    );

    final hasFocus = useState(false);

    void focusListener() {
      hasFocus.value = focusNode.hasPrimaryFocus || controller!.text.isNotEmpty;
    }

    useEffect(() {
      focusNode.addListener(focusListener);

      return () => focusNode.removeListener(focusListener);
    });
    return AnimatedContainer(
      duration: kThemeChangeDuration,
      height: maxLines == null ? null : 64.h,
      padding: contentPadding ??
          (hasFocus.value
              ? EdgeInsets.only(
                  top: 20.w, bottom: 12.w, left: 16.w, right: 16.w)
              : EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h)),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: isObscure ? hideText.value : false,
        textAlignVertical: enabled ? const TextAlignVertical(y: .4) : null,
        controller: controller,
        focusNode: focusNode,
        readOnly: readOnly,
        // enabled: enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: CustomTextStyle.textStyle18w500HG1000.copyWith(height: 1),
        textAlign: textAlign,
        keyboardType: keyboardType,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        cursorHeight: 18.h,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: CustomTextStyle.textStyle18w500HG800,
          labelText: labelText,
          labelStyle: CustomTextStyle.textStyle18w500HG800,
          floatingLabelStyle: CustomTextStyle.textStyle18w500HG800,
          contentPadding: EdgeInsets.only(bottom: 4.h),
          filled: true,
          fillColor: fillColor,
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          disabledBorder: border,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ??
              (isObscure
                  ? KInkWell(
                      borderRadius: radius24,
                      onTap: () {
                        hideText.value = !hideText.value;
                      },
                      child: hideText.value
                          ? const Icon(EvaIcons.eye_off_2_outline)
                          : const Icon(EvaIcons.eye),
                    )
                  : null),
        ),
        onTap: onTap,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

class KTextFormField3 extends HookConsumerWidget {
  const KTextFormField3({
    Key? key,
    this.controller,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const border = InputBorder.none;
    return TextFormField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        border: border,
        focusedBorder: const UnderlineInputBorder(
            // borderSide: BorderSide(color: ColorPalate.grey3),
            ),
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        errorBorder: border,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 0.h,
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
      ),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
