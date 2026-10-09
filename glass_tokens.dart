import 'package:flutter/material.dart';

@immutable
class GlassTokens extends ThemeExtension<GlassTokens> {
  const GlassTokens({
    required this.background,
    required this.surface,
    required this.glassBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.lavender,
    required this.mint,
    required this.success,
    required this.warning,
    required this.danger,
    required this.solidSurface,
  });

  final Color background;
  final Color surface;
  final Color glassBorder;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color lavender;
  final Color mint;
  final Color success;
  final Color warning;
  final Color danger;
  final Color solidSurface;

  static const light = GlassTokens(
    background: Color(0xFFF6F4F1),
    surface: Color(0x8CFFFFFF),
    glassBorder: Color(0x66FFFFFF),
    textPrimary: Color(0xFF14213D),
    textSecondary: Color(0xFF515B70),
    accent: Color(0xFF5B5BD6),
    lavender: Color(0xFFE9E4F5),
    mint: Color(0xFFDDF1EA),
    success: Color(0xFF236747),
    warning: Color(0xFF815700),
    danger: Color(0xFFB42335),
    solidSurface: Color(0xFFFBFAF8),
  );

  static const dark = GlassTokens(
    background: Color(0xFF0B1020),
    surface: Color(0x14FFFFFF),
    glassBorder: Color(0x24FFFFFF),
    textPrimary: Color(0xFFF4F5F8),
    textSecondary: Color(0xFFB9C0D0),
    accent: Color(0xFF8C8CF0),
    lavender: Color(0xFF2A2640),
    mint: Color(0xFF1B3A33),
    success: Color(0xFF7AD7A5),
    warning: Color(0xFFFFD166),
    danger: Color(0xFFFF8994),
    solidSurface: Color(0xFF161C33),
  );

  @override
  GlassTokens copyWith({
    Color? background,
    Color? surface,
    Color? glassBorder,
    Color? textPrimary,
    Color? textSecondary,
    Color? accent,
    Color? lavender,
    Color? mint,
    Color? success,
    Color? warning,
    Color? danger,
    Color? solidSurface,
  }) {
    return GlassTokens(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      glassBorder: glassBorder ?? this.glassBorder,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      accent: accent ?? this.accent,
      lavender: lavender ?? this.lavender,
      mint: mint ?? this.mint,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      solidSurface: solidSurface ?? this.solidSurface,
    );
  }

  @override
  GlassTokens lerp(ThemeExtension<GlassTokens>? other, double t) {
    if (other is! GlassTokens) return this;
    return GlassTokens(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      lavender: Color.lerp(lavender, other.lavender, t)!,
      mint: Color.lerp(mint, other.mint, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      solidSurface: Color.lerp(solidSurface, other.solidSurface, t)!,
    );
  }
}
