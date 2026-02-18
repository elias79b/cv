import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';

class ProjectCard extends StatefulWidget {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final String? githubUrl;
  final String? storeUrl;
  final List<String> tech;
  final int index;

  const ProjectCard({
    super.key,
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    this.githubUrl,
    this.storeUrl,
    required this.tech,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  void _open(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: _hovered
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _hovered
              ? [
            BoxShadow(
              blurRadius: 32,
              color: Colors.black.withOpacity(0.15),
            )
          ]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Screenshot
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),

            // Scrollable content (🔥 کلید حل overflow)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titleKey.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),

                    Text(
                      widget.descriptionKey.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.tech
                          .map(
                            (t) => Chip(
                          label: Text(t),
                          visualDensity: VisualDensity.compact,
                        ),
                      )
                          .toList(),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        if (widget.githubUrl != null)
                          OutlinedButton.icon(
                            onPressed: () =>
                                _open(widget.githubUrl!),
                            icon: const Icon(Icons.code),
                            label: const Text('GitHub'),
                          ),
                        const SizedBox(width: 12),
                        if (widget.storeUrl != null)
                          ElevatedButton.icon(
                            onPressed: () =>
                                _open(widget.storeUrl!),
                            icon: const Icon(Icons.open_in_new),
                            label: Text('view_project'.tr()),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ).animate().fadeIn(
        delay: (widget.index * 150).ms,
        duration: 600.ms,
      ),
    );
  }
}
