import 'package:client/core/localization/app_localizations.dart';
import 'package:client/core/localization/language_provider.dart';
import 'package:client/core/router/gorouter.dart';
import 'package:client/core/services/shared_preferences_service.dart';
import 'package:client/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  await container.read(sharedPreferencesServiceProvider).init();
  runApp(UncontrolledProviderScope(container: container, child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);

    return MaterialApp.router(
      title: 'Ecom_Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
