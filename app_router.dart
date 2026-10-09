import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/care/care_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/monitoring/monitor_screen.dart';
import '../../features/pets/pets_screen.dart';
import '../../features/profile/settings_screen.dart';
import '../../features/veterinary/vet_screen.dart';
import '../theme/glass_tokens.dart';
import '../widgets/ambient_background.dart';
import '../widgets/glass_surface.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/pets', builder: (context, state) => const PetsScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/care', builder: (context, state) => const CareScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/vet', builder: (context, state) => const VetScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/monitor', builder: (context, state) => const MonitorScreen()),
        ]),
      ],
    ),
  ],
);

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const _destinations = <_Destination>[
    _Destination('Home', Icons.home_outlined, Icons.home_rounded),
    _Destination('My Pets', Icons.pets_outlined, Icons.pets_rounded),
    _Destination('Care', Icons.notifications_none_rounded, Icons.notifications_rounded),
    _Destination('Find a Vet', Icons.location_on_outlined, Icons.location_on_rounded),
    _Destination('Monitor', Icons.videocam_outlined, Icons.videocam_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<GlassTokens>()!;
    return Scaffold(
      extendBody: true,
      body: AmbientBackground(child: navigationShell),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(12, 0, 12, 8),
        child: GlassSurface(
          radius: 24,
          blur: 14,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: List.generate(_destinations.length, (index) {
              final item = _destinations[index];
              final selected = navigationShell.currentIndex == index;
              return Expanded(
                child: Semantics(
                  button: true,
                  selected: selected,
                  label: item.label,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 48),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              selected ? item.selectedIcon : item.icon,
                              size: 22,
                              color: selected ? tokens.accent : tokens.textSecondary,
                            ),
                            const SizedBox(height: 4),
                            Flexible(
                              child: Text(
                                item.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                                  color: selected ? tokens.accent : tokens.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _Destination {
  const _Destination(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
