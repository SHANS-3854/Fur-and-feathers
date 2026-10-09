import 'package:flutter/material.dart';

import '../../core/widgets/glass_surface.dart';

class VetScreen extends StatelessWidget {
  const VetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
      children: [
        Text('Find a Vet', style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 8),
        Text('Care from people you can trust.', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        const GlassSurface(
          child: Column(
            children: [
              Icon(Icons.location_searching_rounded, size: 42),
              SizedBox(height: 12),
              Text('Verified clinic data not connected'),
              SizedBox(height: 8),
              Text(
                'No clinics are listed yet. Once a verified source is configured, you can search by location, city or postcode. Your location will only be requested after you tap Use my location.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'GPS, manual search, clinic verification and map handoff will be implemented in Phase 5. This screen does not display invented clinic data.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
