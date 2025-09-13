import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  final Color primaryColor = AppColors.appColor;

  ThemeProvider() {
    _loadPreferences();
  }

  /// -------- Light Theme --------
  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.colorWhite,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      // dynamic
      onPrimary: Colors.white,
      surface: AppColors.colorWhite,

      /// background color
      onSurface: AppColors.colorBlack,
      secondaryFixed: Color(0xFFF9FAFB),

      /// text/labels color
      onSecondaryFixedVariant: Color(0xFF555555),
      onSurfaceVariant: AppColors.hintColor,
      onSecondaryFixed: Color(0xFFC9C9C9),
      secondary: primaryColor.withValues(alpha: 0.7),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFFAFDFD),
      onSecondaryContainer: primaryColor,
      tertiaryContainer: Color(0xFFCBEBE7),
      outline: Color(0xFFBEBEBE),
      // for text-field borders
      outlineVariant: Color(0xFFEEEEEE),
      // for container borders
      shadow: Color(0xFFF9F9F9),
      error: Colors.red,
      onError: Colors.white,
    ),
  );

  /// -------- Preferences Load --------
  void _loadPreferences() async {
    final themeIndex = await AppStorage.readData(AppKeys.themeMode) ?? 0;
    _themeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  /// -------- Theme Switch --------
  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    AppStorage.saveData('themeMode', mode.index);
    notifyListeners();
  }
}
