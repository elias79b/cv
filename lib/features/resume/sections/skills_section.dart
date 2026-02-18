import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/skill_model.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  List<SkillModel> _skills() => const [
    SkillModel(
      titleKey: 'skill_flutter',
      descriptionKey: 'skill_flutter_desc',
      icon: Icons.flutter_dash,
    ),
    SkillModel(
      titleKey: 'skill_state',
      descriptionKey: 'skill_state_desc',
      icon: Icons.account_tree_outlined,
    ),
    SkillModel(
      titleKey: 'skill_backend',
      descriptionKey: 'skill_backend_desc',
      icon: Icons.cloud_outlined,
    ),
    SkillModel(
      titleKey: 'skill_arch',
      descriptionKey: 'skill_arch_desc',
      icon: Icons.layers_outlined,
    ),
    SkillModel(
      titleKey: 'skill_tools',
      descriptionKey: 'skill_tools_desc',
      icon: Icons.build_outlined,
    ),
    SkillModel(
      titleKey: 'skill_ci',
      descriptionKey: 'skill_ci_desc',
      icon: Icons.sync_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final skills = _skills();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1100
        ? 3
        : width > 700
        ? 2
        : 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'skills_title'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 2.5,
            ),
            itemBuilder: (context, index) {
              final skill = skills[index];
              return SkillCard(
                titleKey: skill.titleKey,
                descriptionKey: skill.descriptionKey,
                icon: skill.icon,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
