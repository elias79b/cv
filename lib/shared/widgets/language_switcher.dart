import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localization/locale_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  static const _languages = {
    'en': 'EN',
    'fa': 'FA',
    'de': 'DE',
    'fr': 'FR',
    'es': 'ES',
    'it': 'IT',
    'ar': 'AR',
  };

  @override
  Widget build(BuildContext context) {
    final current = context.locale.languageCode;

    return PopupMenuButton<String>(
      tooltip: 'Language',
      icon: const Icon(Icons.language_outlined),
      onSelected: (code) {
        final locale = Locale(code);
        context.setLocale(locale);
        context.read<LocaleCubit>().changeLocale(locale);
      },
      itemBuilder: (context) => _languages.entries.map((entry) {
        return PopupMenuItem<String>(
          value: entry.key,
          child: Row(
            children: [
              Text(entry.value),
              const Spacer(),
              if (current == entry.key)
                const Icon(Icons.check, size: 16),
            ],
          ),
        );
      }).toList(),
    );
  }
}
