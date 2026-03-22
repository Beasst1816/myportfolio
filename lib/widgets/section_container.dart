import 'package:flutter/material.dart';

import '../utils/responsive.dart';

/// Constrains content width and applies consistent horizontal padding for sections.
class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.maxWidth,
  });

  final Widget child;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cap = maxWidth ?? contentMaxWidth(width);
    return Padding(
      padding: sectionPadding(width),
      child: Align(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: cap),
          child: child,
        ),
      ),
    );
  }
}
