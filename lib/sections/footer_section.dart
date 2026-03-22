import 'package:flutter/material.dart';

import '../constants/app_links.dart';
import '../constants/app_strings.dart';
import '../utils/launch_helpers.dart';
import '../widgets/section_container.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final year = DateTime.now().year;

    return SectionContainer(
      child: Column(
        children: [
          Divider(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.45)),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Text(
                  '© $year Beast. ${AppStrings.footerNote}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => tryLaunchUrlString(context, AppLinks.githubPortfolioRepo),
                child: const Text('Source on GitHub'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
