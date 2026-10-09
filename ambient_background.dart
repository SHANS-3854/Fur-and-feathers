import 'package:flutter/material.dart';

import '../theme/glass_tokens.dart';

class AmbientBackground extends StatelessWidget {
  const AmbientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(color: tokens.background),
        Positioned(
          top: -110,
          left: -90,
          child: _Glow(color: tokens.lavender, size: 280),
        ),
        Positioned(
          top: 180,
          right: -130,
          child: _Glow(color: tokens.mint, size: 300),
        ),
        Positioned(
          bottom: -160,
          left: 25,
          child: _Glow(
            color: tokens.accent.withValues(alpha: 0.12),
            size: 310,
          ),
        ),
        child,
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: ExcludeSemantics(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.48),
            ),
          ),
        ),
      );
}
