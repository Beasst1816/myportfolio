import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_links.dart';
import '../constants/app_strings.dart';
import '../utils/launch_helpers.dart';
import '../widgets/section_container.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkedIn = AppLinks.linkedIn;

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            label: AppStrings.sectionContact,
            subtitle: 'Let’s connect — GitHub, email, and more.',
          ),
          const SizedBox(height: 22),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
              border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.35)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                spacing: 14,
                runSpacing: 14,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _LinkTile(
                    icon: Icons.code_rounded,
                    label: 'GitHub profile',
                    sub: 'github.com/Beasst1816',
                    onTap: () => tryLaunchUrlString(context, AppLinks.githubProfile),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.06, end: 0, duration: 400.ms, curve: Curves.easeOutCubic),
                  _LinkTile(
                    icon: Icons.folder_open_rounded,
                    label: 'Portfolio repository',
                    sub: 'Beasst1816/myportfolio',
                    onTap: () => tryLaunchUrlString(context, AppLinks.githubPortfolioRepo),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 60.ms)
                      .slideY(begin: 0.06, end: 0, duration: 400.ms, curve: Curves.easeOutCubic),
                  if (linkedIn != null && linkedIn.isNotEmpty)
                    _LinkTile(
                      icon: Icons.work_outline_rounded,
                      label: 'LinkedIn',
                      sub: 'Profile',
                      onTap: () => tryLaunchUrlString(context, linkedIn),
                    ),
                  FilledButton.tonalIcon(
                    onPressed: () => tryLaunchUri(context, AppLinks.mailto),
                    icon: const Icon(Icons.mail_outline_rounded),
                    label: Text('Email ${AppLinks.email}'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkTile extends StatelessWidget {
  const _LinkTile({
    required this.icon,
    required this.label,
    required this.sub,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String sub;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                Text(sub, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              ],
            ),
            const SizedBox(width: 8),
            Icon(Icons.open_in_new_rounded, size: 18, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
