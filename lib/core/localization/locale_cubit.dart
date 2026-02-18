import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../storage/preferences_service.dart';

class LocaleCubit extends Cubit<Locale> {
  final PreferencesService prefs;

  LocaleCubit(this.prefs) : super(Locale(prefs.loadLocale()));

  void changeLocale(Locale locale) {
    prefs.saveLocale(locale.languageCode);
    emit(locale);
  }
}
