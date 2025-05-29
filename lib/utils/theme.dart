import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ValueNotifier<Color> appThemeColor =
      ValueNotifier(appDefaultThemeColor);

  static ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  static get appDefaultThemeColor {
    return Colors.orangeAccent;
  }

  static ThemeData get currentTheme =>
      AppTheme.isDarkMode.value ? AppTheme.dark : AppTheme.light;

  static Color contrastColor(Color color) =>
      switch (ThemeData.estimateBrightnessForColor(color)) {
        Brightness.dark => Colors.white,
        Brightness.light => Colors.black
      };

  static ThemeData get light {
    final seedColorScheme = ColorScheme.fromSeed(
      seedColor: appThemeColor.value,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    );

    return ThemeData(
      colorScheme: seedColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: seedColorScheme.primaryContainer,
        foregroundColor: seedColorScheme.onPrimaryContainer,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: seedColorScheme.secondaryContainer,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: seedColorScheme.primary,
          fontSize: 16,
        ),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontStyle: FontStyle.italic,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: seedColorScheme.surface,
      ),
    );
  }

  static ThemeData get dark {
    final seedColorScheme = ColorScheme.fromSeed(
      seedColor: appThemeColor.value,
      brightness: Brightness.dark,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: seedColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: seedColorScheme.primaryContainer,
        foregroundColor: seedColorScheme.onPrimaryContainer,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: seedColorScheme.secondaryContainer,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: seedColorScheme.primary,
          fontSize: 16,
        ),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontStyle: FontStyle.italic,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: seedColorScheme.surfaceBright,
      ),
    );
  }
}
