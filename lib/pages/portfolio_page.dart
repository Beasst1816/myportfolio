import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../sections/contact_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_about_section.dart';
import '../theme/theme_controller.dart';
import '../widgets/portfolio_nav_bar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();

  final _homeKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(String id) {
    final key = switch (id) {
      'home' => _homeKey,
      'projects' => _projectsKey,
      'about' => _aboutKey,
      'contact' => _contactKey,
      _ => _homeKey,
    };
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PortfolioNavBar(
            themeController: widget.themeController,
            onNavigate: _scrollTo,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: true,
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    HeroSection(
                      key: _homeKey,
                      onViewProjects: () => _scrollTo('projects'),
                    ),
                    ProjectsSection(key: _projectsKey),
                    SkillsAboutSection(key: _aboutKey),
                    ContactSection(key: _contactKey),
                    const FooterSection(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
