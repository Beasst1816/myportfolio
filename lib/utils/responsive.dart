import 'package:flutter/material.dart';

enum AppBreakpoint { mobile, tablet, desktop }

AppBreakpoint breakpointOf(double width) {
  if (width >= 1100) return AppBreakpoint.desktop;
  if (width >= 700) return AppBreakpoint.tablet;
  return AppBreakpoint.mobile;
}

double contentMaxWidth(double width) {
  return switch (breakpointOf(width)) {
    AppBreakpoint.mobile => width,
    AppBreakpoint.tablet => 720,
    AppBreakpoint.desktop => 1040,
  };
}

int projectCrossAxisCount(double width) {
  return switch (breakpointOf(width)) {
    AppBreakpoint.mobile => 1,
    AppBreakpoint.tablet => 2,
    AppBreakpoint.desktop => 2,
  };
}

EdgeInsets sectionPadding(double width) {
  final h = switch (breakpointOf(width)) {
    AppBreakpoint.mobile => 20.0,
    AppBreakpoint.tablet => 28.0,
    AppBreakpoint.desktop => 32.0,
  };
  return EdgeInsets.symmetric(horizontal: h, vertical: 56);
}
