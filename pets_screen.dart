import 'package:flutter/material.dart';

import '../../core/theme/glass_tokens.dart';
import '../../core/widgets/glass_surface.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
      children: [
        Text('My Pets', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 8),
        Text('Every little detail, all in one place.', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        GlassSurface(
          radius: 28,
          child: Column(
            children: [
              Icon(Icons.pets_rounded, size: 42, color: tokens.accent),
              const SizedBox(height: 12),
              Text('No pet profiles yet', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(
                'Add a pet to keep their details, health records, and favourite routines together.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pet profile form is planned for Phase 2.')),
                ),
                icon: const Icon(Icons.add_rounded),
                label: const Text('Add a pet'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
