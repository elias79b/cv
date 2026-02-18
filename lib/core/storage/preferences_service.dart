import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_state.dart';

class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService(this.prefs);

  // THEME
  Future<void> saveTheme(AppThemeMode mode) async {
    await prefs.setString('theme_mode', mode.name);
  }

  AppThemeMode loadTheme() {
    final value = prefs.getString('theme_mode');
    return AppThemeMode.values.firstWhere(
          (e) => e.name == value,
      orElse: () => AppThemeMode.system,
    );
  }

  // LOCALE
  Future<void> saveLocale(String code) async {
    await prefs.setString('locale', code);
  }

  String loadLocale() {
    return prefs.getString('locale') ?? 'en';
  }
}
