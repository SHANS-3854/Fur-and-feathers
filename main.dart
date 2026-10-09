import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/theme/settings_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = await AppSettingsController.create();
  runApp(
    ProviderScope(
      overrides: [appSettingsProvider.overrideWith((ref) => settings)],
      child: const PetCareApp(),
    ),
  );
}
