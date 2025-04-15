import 'package:admin_panel/core/providers/token_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Home"),
            ElevatedButton(
              onPressed: () {
                ref.read(tokenManagerProvider.notifier).setToken("");
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
