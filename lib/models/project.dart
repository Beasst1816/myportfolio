import 'package:flutter/foundation.dart';

@immutable
final class Project {
  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.sourceUrl,
  });

  final String title;
  final String description;
  final List<String> tags;

  /// GitHub or other source URL; null shows a disabled code link until you add it.
  final String? sourceUrl;
}
