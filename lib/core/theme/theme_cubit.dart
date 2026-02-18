import 'package:flutter_bloc/flutter_bloc.dart';
import '../storage/preferences_service.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<AppThemeMode> {
  final PreferencesService prefs;

  ThemeCubit(this.prefs) : super(prefs.loadTheme());

  void changeTheme(AppThemeMode mode) {
    prefs.saveTheme(mode);
    emit(mode);
  }
}
