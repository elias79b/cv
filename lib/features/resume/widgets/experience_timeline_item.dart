import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class ExperienceTimelineItem extends StatefulWidget {
  final String roleKey;
  final String company;
  final String dateKey;
  final List<String> achievementsKeys;
  final bool isLast;
  final int index;

  const ExperienceTimelineItem({
    super.key,
    required this.roleKey,
    required this.company,
    required this.dateKey,
    required this.achievementsKeys,
    required this.isLast,
    required this.index,
  });

  @override
  State<ExperienceTimelineItem> createState() =>
      _ExperienceTimelineItemState();
}

class _ExperienceTimelineItemState
    extends State<ExperienceTimelineItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line + dot
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              if (!widget.isLast)
                Container(
                  width: 2,
                  height: 120,
                  color: Theme.of(context)
                      .colorScheme
                      .outlineVariant,
                ),
            ],
          ),
          const SizedBox(width: 24),

          // Content Card
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: _hovered
                  ? (Matrix4.identity()..translate(0, -4))
                  : Matrix4.identity(),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: _hovered
                    ? [
                  BoxShadow(
                    blurRadius: 24,
                    color: Colors.black.withOpacity(0.12),
                  )
                ]
                    : [],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.roleKey.tr(),
                    style:
                    Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.company,
                    style:
                    Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.dateKey.tr(),
                    style:
                    Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 12),
                  ...widget.achievementsKeys.map(
                        (a) => Padding(
                      padding:
                      const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const Text('•  '),
                          Expanded(
                            child: Text(a.tr()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).animate().fadeIn(
        delay: (widget.index * 180).ms,
        duration: 600.ms,
      ),
    );
  }
}
