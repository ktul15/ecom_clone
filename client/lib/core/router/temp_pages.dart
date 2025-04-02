import 'package:client/core/router/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("accounts"));
  }
}

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("pay"));
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("cart"));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("settings")),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(RoutePaths.settingsDetails);
          },
          child: Text("go to details"),
        ),
      ],
    );
  }
}

class SettingsDetailsPage extends StatelessWidget {
  const SettingsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Center(child: Text("settings details"))]);
  }
}
