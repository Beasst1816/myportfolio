import 'package:flutter/material.dart';

import '../theme/theme_controller.dart';

class PortfolioNavBar extends StatelessWidget {
  const PortfolioNavBar({
    super.key,
    required this.themeController,
    required this.onNavigate,
  });

  final ThemeController themeController;
  final void Function(String sectionId) onNavigate;

  static const _sections = <MapEntry<String, String>>[
    MapEntry('home', 'Home'),
    MapEntry('projects', 'Projects'),
    MapEntry('about', 'About'),
    MapEntry('contact', 'Contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 720;

    return Material(
      color: theme.colorScheme.surface.withValues(alpha: 0.96),
      elevation: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.35)),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => onNavigate('home'),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
                      'Beast',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                if (!compact)
                  Row(
                    children: [
                      for (final e in _sections)
                        TextButton(
                          onPressed: () => onNavigate(e.key),
                          child: Text(e.value),
                        ),
                    ],
                  )
                else
                  PopupMenuButton<String>(
                    tooltip: 'Navigate',
                    onSelected: onNavigate,
                    itemBuilder: (context) => [
                      for (final e in _sections)
                        PopupMenuItem(value: e.key, child: Text(e.value)),
                    ],
                    icon: const Icon(Icons.menu_rounded),
                  ),
                ListenableBuilder(
                  listenable: themeController,
                  builder: (context, _) {
                    final dark = themeController.isDark;
                    return IconButton(
                      tooltip: dark ? 'Light mode' : 'Dark mode',
                      onPressed: themeController.toggle,
                      icon: Icon(dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
