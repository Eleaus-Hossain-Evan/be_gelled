import 'package:flutter/material.dart';
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
