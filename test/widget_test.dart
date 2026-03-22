import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myportfolio/pages/portfolio_page.dart';
import 'package:myportfolio/theme/app_theme.dart';
import 'package:myportfolio/theme/theme_controller.dart';

void main() {
  testWidgets('Hero introduces Beast', (WidgetTester tester) async {
    final controller = ThemeController();
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light(null),
        home: PortfolioPage(themeController: controller),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.textContaining('Beast'), findsWidgets);
    expect(find.textContaining('Flutter Developer'), findsWidgets);
  });
}
