import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/experience_model.dart';
import '../widgets/experience_timeline_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  List<ExperienceModel> _experiences() => const [
    ExperienceModel(
      roleKey: 'exp_tadilo_role',
      company: 'Tadilo (Iran – Erbil)',
      dateKey: 'exp_tadilo_date',
      achievementsKeys: [
        'exp_tadilo_a1',
        'exp_tadilo_a2',
      ],
    ),
    ExperienceModel(
      roleKey: 'exp_sarvina_role',
      company: 'Sarvina',
      dateKey: 'exp_sarvina_date',
      achievementsKeys: [
        'exp_sarvina_a1',
        'exp_sarvina_a2',
        'exp_sarvina_a3',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final experiences = _experiences();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 64,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'experience_title'.tr(),
            style:
            Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            separatorBuilder: (_, __) =>
            const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final exp = experiences[index];
              return ExperienceTimelineItem(
                roleKey: exp.roleKey,
                company: exp.company,
                dateKey: exp.dateKey,
                achievementsKeys: exp.achievementsKeys,
                isLast: index == experiences.length - 1,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
