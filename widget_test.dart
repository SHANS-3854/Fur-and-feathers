import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petcare/app.dart';
import 'package:petcare/core/theme/settings_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Home and five bottom destinations render', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final settings = await AppSettingsController.create();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appSettingsProvider.overrideWith((ref) => settings)],
        child: const PetCareApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('A little more care,\nevery day.'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('My Pets'), findsOneWidget);
    expect(find.text('Care'), findsOneWidget);
    expect(find.text('Find a Vet'), findsOneWidget);
    expect(find.text('Monitor'), findsOneWidget);
  });
}
