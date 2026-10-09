import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/glass_tokens.dart';
import '../theme/settings_controller.dart';

class GlassSurface extends ConsumerWidget {
  const GlassSurface({
    super.key,
    required this.child,
    this.radius = 24,
    this.blur = 22,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final double radius;
  final double blur;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final reduce = ref.watch(reduceEffectsProvider) ||
        MediaQuery.of(context).highContrast;
    final shape = BorderRadius.circular(radius);

    final surface = DecoratedBox(
      decoration: BoxDecoration(
        color: reduce ? tokens.solidSurface : tokens.surface,
        borderRadius: shape,
        border: Border.all(color: tokens.glassBorder, width: 0.5),
        gradient: reduce
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.center,
                colors: [
                  Colors.white.withValues(alpha: isDark ? 0.10 : 0.35),
                  Colors.white.withValues(alpha: 0),
                ],
              ),
      ),
      child: Padding(padding: padding, child: child),
    );

    return RepaintBoundary(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: shape,
          boxShadow: reduce
              ? null
              : [
                  BoxShadow(
                    color: const Color(0xFF0B1020).withValues(alpha: 0.08),
                    blurRadius: 28,
                    offset: const Offset(0, 10),
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: shape,
          child: reduce
              ? surface
              : BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blur.clamp(0, 30),
                    sigmaY: blur.clamp(0, 30),
                  ),
                  child: surface,
                ),
        ),
      ),
    );
  }
}
