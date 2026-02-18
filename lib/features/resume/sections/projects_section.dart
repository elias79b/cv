import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/project_model.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  List<ProjectModel> _projects() => const [
    ProjectModel(
      titleKey: 'project_tarazino',
      descriptionKey: 'project_tarazino_desc',
      imagePath: 'assets/images/tarazino.png',
      storeUrl:
      'https://cafebazaar.ir/app/com.example.tarazino',
      tech: ['Flutter', 'Material 3', 'Localization'],
    ),
    ProjectModel(
      titleKey: 'project_speech',
      descriptionKey: 'project_speech_desc',
      imagePath: 'assets/images/speech.png',
      storeUrl:
      'https://cafebazaar.ir/app/com.example.speech',
      tech: ['Flutter', 'Speech to Text', 'Performance'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final projects = _projects();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1100
        ? 2
        : 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'projects_title'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              final p = projects[index];
              return ProjectCard(
                titleKey: p.titleKey,
                descriptionKey: p.descriptionKey,
                imagePath: p.imagePath,
                githubUrl: p.githubUrl,
                storeUrl: p.storeUrl,
                tech: p.tech,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}
