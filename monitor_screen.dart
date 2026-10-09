import 'package:flutter/material.dart';

import '../../core/theme/glass_tokens.dart';
import '../../core/widgets/glass_surface.dart';

class MonitorScreen extends StatelessWidget {
  const MonitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
      children: [
        Text('Monitor', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 8),
        Text('A little peace of mind, from home.', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        GlassSurface(
          radius: 28,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: tokens.solidSurface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: tokens.glassBorder),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.videocam_off_outlined, size: 42, color: tokens.textSecondary),
                      const SizedBox(height: 12),
                      Text('Camera idle', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text('No stream configured', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text('ESP32-CAM monitor', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(
                'The planned first release supports MJPEG over HTTP. No fake video is shown. Camera setup and reconnect controls arrive in Phase 6.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
