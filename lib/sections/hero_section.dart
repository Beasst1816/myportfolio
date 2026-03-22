import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_links.dart';
import '../constants/app_strings.dart';
import '../utils/launch_helpers.dart';
import '../widgets/section_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onViewProjects,
  });

  final VoidCallback onViewProjects;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final width = MediaQuery.sizeOf(context).width;
    final isNarrow = width < 900;

    return SectionContainer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              scheme.primaryContainer.withValues(alpha: 0.35),
              scheme.secondaryContainer.withValues(alpha: 0.22),
              scheme.surfaceContainerHighest.withValues(alpha: 0.15),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.35)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _avatar(context),
                    const SizedBox(height: 24),
                    _copyAndActions(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _copyAndActions(context)),
                    const SizedBox(width: 32),
                    _avatar(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _avatar(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width < 600 ? 120.0 : 160.0;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/profile.jpg',
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) {
            return Container(
              width: size,
              height: size,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
              child: Icon(
                Icons.person_rounded,
                size: size * 0.45,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            );
          },
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 500.ms, curve: Curves.easeOut)
        .scale(begin: const Offset(0.96, 0.96), curve: Curves.easeOutCubic);
  }

  Widget _copyAndActions(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.heroHeadline,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        )
            .animate()
            .fadeIn(duration: 450.ms, delay: 80.ms)
            .slideY(begin: 0.12, end: 0, duration: 450.ms, curve: Curves.easeOutCubic),
        const SizedBox(height: 8),
        Text(
          AppStrings.heroSub,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
            height: 1.15,
          ),
        )
            .animate()
            .fadeIn(duration: 450.ms, delay: 140.ms)
            .slideY(begin: 0.12, end: 0, duration: 450.ms, curve: Curves.easeOutCubic),
        const SizedBox(height: 16),
        Text(
          AppStrings.heroBlurb,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.55,
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms, delay: 220.ms)
            .slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOutCubic),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: onViewProjects,
              icon: const Icon(Icons.work_outline_rounded),
              label: const Text(AppStrings.ctaProjects),
            ),
            OutlinedButton.icon(
              onPressed: () => _onResume(context),
              icon: const Icon(Icons.download_rounded),
              label: const Text(AppStrings.ctaResume),
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 500.ms, delay: 300.ms)
            .slideY(begin: 0.08, end: 0, duration: 500.ms, curve: Curves.easeOutCubic),
      ],
    );
  }

  Future<void> _onResume(BuildContext context) async {
    final url = AppLinks.resumeUrl;
    if (url == null || url.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Set AppLinks.resumeUrl in lib/constants/app_links.dart to your hosted PDF.',
          ),
        ),
      );
      return;
    }
    await tryLaunchUrlString(context, url);
  }
}
