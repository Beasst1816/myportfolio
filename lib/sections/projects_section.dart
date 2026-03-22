import 'package:flutter/material.dart';

import '../constants/app_links.dart';
import '../models/project.dart';
import '../utils/launch_helpers.dart';
import '../utils/responsive.dart';
import '../widgets/section_container.dart';
import '../widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static List<Project> get _projects => const [
        Project(
          title: 'Battery-Aware Movie Recommender',
          description:
              'An innovative Flutter app that dynamically suggests movies based on the '
              'device battery level — showcasing hardware integration, adaptive UX, and '
              'robust state management.',
          tags: [
            'Flutter',
            'Dart',
            'Hardware integration',
            'State management',
          ],
          sourceUrl: AppLinks.batteryRecommenderRepo,
        ),
        Project(
          title: 'Multi-App Project Suite',
          description:
              'Large-scale delivery: architected and built six separate applications in '
              'parallel — five focused utility apps plus one complex flagship product — '
              'demonstrating multi-repo discipline, scale, and consistent engineering quality.',
          tags: [
            'Flutter',
            'Dart',
            'Architecture',
            'Multi-codebase',
          ],
          sourceUrl: AppLinks.multiAppSuiteRepo,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final count = projectCrossAxisCount(width);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: 'Projects',
            subtitle: 'Selected work — swap in live repo links when you publish them.',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final ratio = _aspectRatioFor(constraints.maxWidth, count);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  childAspectRatio: ratio,
                ),
                itemCount: _projects.length,
                itemBuilder: (context, index) => _ProjectCard(project: _projects[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  double _aspectRatioFor(double maxWidth, int count) {
    final per = (maxWidth - (count - 1) * 18) / count;
    if (count == 1) {
      return (per / 360).clamp(0.78, 1.05);
    }
    return (per / 330).clamp(0.95, 1.25);
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final url = project.sourceUrl;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.layers_rounded, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    project.title,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                IconButton(
                  tooltip: url == null ? 'Add a source URL' : 'View source',
                  onPressed: url == null
                      ? null
                      : () => tryLaunchUrlString(context, url),
                  icon: Icon(
                    Icons.code_rounded,
                    color: url == null
                        ? theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.35)
                        : theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                project.description,
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final t in project.tags)
                  Chip(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    label: Text(t, style: theme.textTheme.labelMedium),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
