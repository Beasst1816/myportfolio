/// Central place to update outbound links for the deployed site.
abstract final class AppLinks {
  static const String githubProfile = 'https://github.com/Beasst1816';
  static const String githubPortfolioRepo = 'https://github.com/Beasst1816/myportfolio';

  /// Optional: add when you publish a public profile.
  static const String? linkedIn = null;

  static const String email = 'bhaggubaba1@gmail.com';

  static Uri get mailto => Uri.parse('mailto:$email');

  /// Hosted PDF (GitHub raw, Drive, or your domain). Set when ready; until then the
  /// resume button shows a short hint in-app.
  static const String? resumeUrl = null;

  static const String? batteryRecommenderRepo = null;
  static const String? multiAppSuiteRepo = null;
}
