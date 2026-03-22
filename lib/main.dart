import 'package:flutter/material.dart';

import 'constants/app_strings.dart';
import 'pages/portfolio_page.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

final ThemeController _themeController = ThemeController();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ListenableBuilder(
      listenable: _themeController,
      builder: (context, _) => const PortfolioRoot(),
    ),
  );
}

class PortfolioRoot extends StatelessWidget {
  const PortfolioRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: _themeController.mode,
      theme: AppTheme.light(null),
      darkTheme: AppTheme.dark(null),
      home: PortfolioPage(themeController: _themeController),
    );
  }
}
