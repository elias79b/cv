import 'package:elias/features/resume/sections/experience_section.dart';
import 'package:elias/features/resume/sections/projects_section.dart';
import 'package:elias/features/resume/sections/skills_section.dart';
import 'package:elias/features/resume/widgets/hero_contact_section.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/app_navigation_bar.dart';
import '../sections/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      body: ListView(
        children: const [
          HeroContactSection(),
          const SkillsSection(),
          ProjectsSection(),
          ExperienceSection()
        ],
      ),
    );
  }
}
