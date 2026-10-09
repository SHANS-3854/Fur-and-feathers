import 'package:flutter/material.dart';

import '../../core/widgets/glass_surface.dart';

class CareScreen extends StatelessWidget {
  const CareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
      children: [
        Text('Care & Reminders', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 8),
        Text('Gentle routines, right on time.', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        const GlassSurface(child: _EmptyCareState()),
        const SizedBox(height: 12),
        const Text(
          'Scheduled alerts are not active in Phase 1. Notification scheduling, recurrence, timezone handling and snooze will be implemented in Phase 3.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _EmptyCareState extends StatelessWidget {
  const _EmptyCareState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.notifications_none_rounded, size: 42),
        const SizedBox(height: 12),
        Text('No reminders yet', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(
          'Create your pet profile first. Then set feeding, water, medicine, grooming and vet reminders.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
