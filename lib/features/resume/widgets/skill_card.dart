import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class SkillCard extends StatefulWidget {
  final String titleKey;
  final String descriptionKey;
  final IconData icon;
  final int index;

  const SkillCard({
    super.key,
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
    required this.index,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovered
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 24,
            )
          ]
              : [],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, size: 36),
            const SizedBox(height: 16),
            Text(
              widget.titleKey.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              widget.descriptionKey.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ).animate().fadeIn(
        delay: (widget.index * 120).ms,
        duration: 500.ms,
      ),
    );
  }
}
