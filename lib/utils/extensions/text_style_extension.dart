part of 'extensions.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}

extension TextThemeStylesX on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
}
