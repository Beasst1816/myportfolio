import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> tryLaunchUri(BuildContext context, Uri uri) async {
  final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not open link: $uri')),
    );
  }
}

Future<void> tryLaunchUrlString(BuildContext context, String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid URL')),
      );
    }
    return;
  }
  await tryLaunchUri(context, uri);
}
