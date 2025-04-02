import 'package:client/core/localization/app_localizations.dart';
import 'package:client/core/localization/language_provider.dart';
import 'package:client/core/theme/theme.dart';
import 'package:client/features/auth/views/pages/sign_in_or_create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);

    return MaterialApp(
      title: 'Ecom_Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SignInOrCreateAccountPage(),
    );
  }
}
