import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/theme/theme_cubit.dart';
import '../../core/theme/theme_state.dart';
import 'theme_switcher.dart';
import 'language_switcher.dart';

class AppNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text('Elyas'),
      actions: const [
        ThemeSwitcher(),
        SizedBox(width: 8),
        LanguageSwitcher(),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
