import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/cubit/resume_tab_cubit.dart';

class ResumeTabs extends StatelessWidget {
  const ResumeTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeTabCubit, ResumeTab>(
      builder: (context, activeTab) {
        return Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: ResumeTab.values.map((tab) {
              final isActive = tab == activeTab;
              return GestureDetector(
                onTap: () =>
                    context.read<ResumeTabCubit>().changeTab(tab),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _title(tab).tr(),
                    style: TextStyle(
                      color: isActive
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  String _title(ResumeTab tab) {
    switch (tab) {
      case ResumeTab.home:
        return 'tab_home';
      case ResumeTab.experience:
        return 'tab_experience';
      case ResumeTab.projects:
        return 'tab_projects';
    }
  }
}
