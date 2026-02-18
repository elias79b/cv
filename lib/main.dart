import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'core/theme/theme_state.dart';
import 'core/localization/locale_cubit.dart';
import 'core/storage/preferences_service.dart';
import 'features/resume/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final preferencesService = PreferencesService(prefs);

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
        Locale('de'),
        Locale('fr'),
        Locale('es'),
        Locale('it'),
        Locale('ar'),
      ],
      path: 'assets/translations', // مسیر درست پوشه ترجمه
      fallbackLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(preferencesService),
          ),
          BlocProvider(
            create: (_) => LocaleCubit(preferencesService),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, AppThemeMode>(
      builder: (context, themeMode) {
        return BlocListener<LocaleCubit, Locale>(
          listener: (context, locale) {
            // بروز رسانی HTML lang برای Flutter Web
            html.document.documentElement?.lang = locale.languageCode;
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Elyas Babakhani | Flutter Developer',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _mapThemeMode(themeMode),
            locale: context.watch<LocaleCubit>().state,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            home: const HomePage(),
          ),
        );
      },
    );
  }

  // تابع کمکی برای تبدیل AppThemeMode به ThemeMode
  ThemeMode _mapThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
      default:
        return ThemeMode.system;
    }
  }
}
