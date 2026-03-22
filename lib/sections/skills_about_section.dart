import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_strings.dart';
import '../widgets/section_container.dart';
import '../widgets/section_title.dart';

class SkillsAboutSection extends StatelessWidget {
  const SkillsAboutSection({super.key});

  static const _skills = <String>[
    'Flutter',
    'Dart',
    'Cross-platform development',
    'UI / UX implementation',
    'Responsive design',
    'Performance tuning',
    'Clean architecture',
    'Git & collaboration',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: AppStrings.sectionSkillsAbout,
            subtitle: 'What I focus on day to day.',
          ),
          const SizedBox(height: 22),
          Text(
            AppStrings.aboutBody,
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < _skills.length; i++)
                _SkillChip(label: _skills[i], index: i),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.label, required this.index});

  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(label),
      avatar: Icon(Icons.bolt_rounded, size: 18, color: theme.colorScheme.primary),
      side: BorderSide(color: theme.colorScheme.outlineVariant),
    )
        .animate()
        .fadeIn(duration: 350.ms, delay: (40 * index).ms)
        .slideX(begin: 0.04, end: 0, duration: 350.ms, curve: Curves.easeOutCubic);
  }
}
