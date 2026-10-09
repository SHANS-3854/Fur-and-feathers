import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/glass_tokens.dart';
import '../../core/widgets/glass_surface.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    final now = DateTime.now();
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 120),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_dateLabel(now), style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 8),
                  Text(
                    'A little more care,\nevery day.',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
            Semantics(
              button: true,
              label: 'Open settings',
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => context.push('/settings'),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: tokens.lavender,
                  child: Icon(Icons.settings_outlined, color: tokens.accent),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        GlassSurface(
          radius: 28,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: tokens.mint,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.pets_rounded, color: tokens.textPrimary, size: 26),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your pet story starts here',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 4),
                        Text(
                          'Create a profile to make care feel effortless.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => context.go('/pets'),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Add your first pet'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Today's care", style: Theme.of(context).textTheme.headlineMedium),
            Text('0 tasks', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 12),
        GlassSurface(
          radius: 20,
          child: Row(
            children: [
              SizedBox(
                width: 54,
                height: 54,
                child: CircularProgressIndicator(
                  value: 0,
                  strokeWidth: 5,
                  backgroundColor: tokens.glassBorder,
                  color: tokens.accent,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('A fresh start', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(
                      'Add a pet and your daily checklist will appear here.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text('Quick actions', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _QuickAction(icon: Icons.restaurant_outlined, label: 'Feed'),
            _QuickAction(icon: Icons.water_drop_outlined, label: 'Water'),
            _QuickAction(icon: Icons.medication_outlined, label: 'Medication'),
            _QuickAction(icon: Icons.content_cut_rounded, label: 'Grooming'),
            _QuickAction(icon: Icons.calendar_month_outlined, label: 'Appointment'),
          ],
        ),
        const SizedBox(height: 24),
        Text('Shortcuts', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _Shortcut(icon: Icons.location_on_outlined, label: 'Nearby vet', onTap: () => context.go('/vet'))),
            const SizedBox(width: 8),
            Expanded(child: _Shortcut(icon: Icons.notifications_active_outlined, label: 'Reminders', onTap: () => context.go('/care'))),
            const SizedBox(width: 8),
            Expanded(child: _Shortcut(icon: Icons.videocam_outlined, label: 'Monitor', onTap: () => context.go('/monitor'))),
          ],
        ),
      ],
    );
  }

  static String _dateLabel(DateTime date) {
    const weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return '${weekdays[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}';
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    return Chip(
      avatar: Icon(icon, size: 18, color: tokens.accent),
      label: Text(label),
      backgroundColor: tokens.surface,
      side: BorderSide(color: tokens.glassBorder, width: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class _Shortcut extends StatelessWidget {
  const _Shortcut({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: GlassSurface(
        radius: 16,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            Icon(icon, color: tokens.accent, size: 22),
            const SizedBox(height: 6),
            Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
