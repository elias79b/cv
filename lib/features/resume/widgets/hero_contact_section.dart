import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../core/utils/contact_links.dart';
import 'contact_card.dart';

class HeroContactSection extends StatelessWidget {
  const HeroContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),

        /// HERO
        Text(
          'hero_name'.tr(),
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'hero_title'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        /// CONTACT
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ContactCard(
              icon: Icons.email,
              title: 'email_title'.tr(),
              subtitle: 'email_sub'.tr(),
              onTap: openEmail,
            ),
            ContactCard(
              icon: Icons.social_distance,
              title: 'whatsapp_title'.tr(),
              subtitle: 'whatsapp_sub'.tr(),
              onTap: openWhatsApp,
            ),
            ContactCard(
              icon: Icons.send,
              title: 'telegram_title'.tr(),
              subtitle: 'telegram_sub'.tr(),
              onTap: openTelegram,
            ),
            ContactCard(
              icon: Icons.code,
              title: 'github_title'.tr(),
              subtitle: 'github_sub'.tr(),
              onTap: openGitHub,
            ),
          ],
        ),
      ],
    );
  }
}
