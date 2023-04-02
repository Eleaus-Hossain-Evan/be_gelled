import '../../utils/utils.dart';
import 'package:flutter/material.dart';

extension TextThemeStylesX on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
}
