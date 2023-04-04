import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/local_storage/storage_handler.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  final database = ref.watch(databaseService);

  return ThemeController(database);
});

class ThemeController with ChangeNotifier {
  ThemeController(this._database);

  late final DatabaseService _database;

  String get theme => _database.savedTheme;

  void toggle(bool mode) {
    (mode)
        ? _database.toggleSaveTheme("dark")
        : _database.toggleSaveTheme("light");

    notifyListeners();
  }
}

//** DATABASE CLASS */
final databaseService = Provider<DatabaseService>((ref) {
  return DatabaseService(ref);
});

class DatabaseService {
  final Ref ref;

  DatabaseService(this.ref) {
    initTheme();
  }

  get savedTheme => ref.watch(hiveProvider).get(KStrings.theme);

  void initTheme() {
    ref.watch(hiveProvider).put(KStrings.theme, 'light');
  }

  void toggleSaveTheme(String mode) =>
      ref.watch(hiveProvider).put(KStrings.theme, mode);
}

class MyTheme {
  // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
  static final lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: ColorPalate.primary,
      secondary: ColorPalate.secondary,
      tertiary: ColorPalate.green,
      error: ColorPalate.error,
    ),
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    scaffoldBackground: ColorPalate.white,
    appBarBackground: ColorPalate.white,
    surface: ColorPalate.white,
    blendLevel: 9,
    subThemesData: FlexSubThemesData(
      useTextTheme: true,
    ),
    useMaterial3: true,
    useMaterial3ErrorColors: true,
    // visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: ColorPalate.primary,
      secondary: ColorPalate.secondary,
      error: ColorPalate.error,
    ),
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    scaffoldBackground: ColorPalate.white,
    appBarBackground: ColorPalate.white,
    surface: ColorPalate.white,
    blendLevel: 9,
    subThemesData: const FlexSubThemesData(useTextTheme: true),
    useMaterial3: true,
    useMaterial3ErrorColors: true,
    // visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.inter().fontFamily,
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
