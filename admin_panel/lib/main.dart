import 'package:admin_panel/core/providers/token_provider.dart';
import 'package:admin_panel/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the token from the provider to reactively rebuild when it changes
    final tokenAsync = ref.watch(tokenManagerProvider);

    return tokenAsync.when(
      data: (token) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Ecom Admin Panel',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig:
              token != null && token != "" ? gorouter : loggedOutGoRouter,
        );
      },
      loading:
          () => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          ),
      error:
          (error, stack) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: Text('Error: $error'))),
          ),
    );
  }
}
