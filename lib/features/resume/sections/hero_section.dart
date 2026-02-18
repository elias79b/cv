import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Elyas Babakhani',
            style: Theme.of(context).textTheme.headlineLarge,
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: 0.3),

          const SizedBox(height: 16),

          Text(
            'hero_title'.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          )
              .animate(delay: 200.ms)
              .fadeIn()
              .slideY(begin: 0.3),

        ],
      ),
    );
  }
}
