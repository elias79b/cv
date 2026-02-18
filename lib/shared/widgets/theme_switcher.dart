import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/theme_cubit.dart';
import '../../core/theme/theme_state.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<ThemeCubit>().state;

    return PopupMenuButton<AppThemeMode>(
      tooltip: 'Theme',
      icon: const Icon(Icons.color_lens_outlined),
      onSelected: (mode) {
        context.read<ThemeCubit>().changeTheme(mode);
      },
      itemBuilder: (context) => [
        _buildItem(
          mode: AppThemeMode.light,
          icon: Icons.light_mode_outlined,
          label: 'Light',
          current: current,
        ),
        _buildItem(
          mode: AppThemeMode.dark,
          icon: Icons.dark_mode_outlined,
          label: 'Dark',
          current: current,
        ),
        _buildItem(
          mode: AppThemeMode.system,
          icon: Icons.settings_suggest_outlined,
          label: 'System',
          current: current,
        ),
      ],
    );
  }

  PopupMenuItem<AppThemeMode> _buildItem({
    required AppThemeMode mode,
    required IconData icon,
    required String label,
    required AppThemeMode current,
  }) {
    return PopupMenuItem<AppThemeMode>(
      value: mode,
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(label),
          const Spacer(),
          if (current == mode)
            const Icon(Icons.check, size: 16),
        ],
      ),
    );
  }
}
