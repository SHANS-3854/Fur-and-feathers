import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeKey = 'petcare.themeMode';
const _reduceEffectsKey = 'petcare.reduceEffects';

final appSettingsProvider =
    ChangeNotifierProvider<AppSettingsController>((ref) {
  throw StateError('Override appSettingsProvider in main.dart');
});

final reduceEffectsProvider = Provider<bool>(
  (ref) => ref.watch(appSettingsProvider).reduceEffects,
);

class AppSettingsController extends ChangeNotifier {
  AppSettingsController._(this._preferences)
      : _themeMode = _readTheme(_preferences.getString(_themeKey)),
        _reduceEffects = _preferences.getBool(_reduceEffectsKey) ?? false;

  final SharedPreferences _preferences;
  ThemeMode _themeMode;
  bool _reduceEffects;

  static Future<AppSettingsController> create() async {
    final preferences = await SharedPreferences.getInstance();
    return AppSettingsController._(preferences);
  }

  ThemeMode get themeMode => _themeMode;
  bool get reduceEffects => _reduceEffects;

  static ThemeMode _readTheme(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode value) async {
    if (_themeMode == value) return;
    _themeMode = value;
    notifyListeners();
    await _preferences.setString(_themeKey, value.name);
  }

  Future<void> setReduceEffects(bool value) async {
    if (_reduceEffects == value) return;
    _reduceEffects = value;
    notifyListeners();
    await _preferences.setBool(_reduceEffectsKey, value);
  }
}
