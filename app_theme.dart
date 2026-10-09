import 'package:flutter/material.dart';

import 'glass_tokens.dart';

class AppTheme {
  static ThemeData light() => _build(Brightness.light, GlassTokens.light);
  static ThemeData dark() => _build(Brightness.dark, GlassTokens.dark);

  static ThemeData _build(Brightness brightness, GlassTokens tokens) {
    final scheme = ColorScheme.fromSeed(
      seedColor: tokens.accent,
      brightness: brightness,
      surface: tokens.background,
      primary: tokens.accent,
      error: tokens.danger,
    );
    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: tokens.background,
      extensions: <ThemeExtension<dynamic>>[tokens],
    );
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        displayLarge: TextStyle(
          fontSize: 34,
          height: 1.15,
          fontWeight: FontWeight.w700,
          color: tokens.textPrimary,
          letterSpacing: -0.8,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          height: 1.2,
          fontWeight: FontWeight.w700,
          color: tokens.textPrimary,
          letterSpacing: -0.4,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: tokens.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.45,
          color: tokens.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
          color: tokens.textSecondary,
        ),
        labelSmall: TextStyle(
          fontSize: 13,
          color: tokens.textSecondary,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: tokens.background,
        foregroundColor: tokens.textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
