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
