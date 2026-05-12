import 'package:flutter/material.dart';
import 'raeya_colors.dart';

class RaeyaTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: RaeyaColors.primary,
      scaffoldBackgroundColor: RaeyaColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: RaeyaColors.primary,
        primary: RaeyaColors.primary,
        surface: RaeyaColors.surface,
        error: RaeyaColors.error,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: RaeyaColors.textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          color: RaeyaColors.textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: RaeyaColors.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
