import 'package:client/core/localization/app_localizations.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:client/features/auth/views/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Image.asset(
                  "assets/images/amazon_logo.png",
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                Text(
                  localizations.signInTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildBenefitsList(context),
                const SizedBox(height: 32),
                CommonButton.primary(title: localizations.signInButton),
                const SizedBox(height: 12),
                CommonButton.grayed(title: localizations.createAccountButton),
                const SizedBox(height: 12),
                CommonButton.grayed(title: localizations.skipSignInButton),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitsList(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBenefitItem(Icons.favorite, localizations.viewWishlist),
        const SizedBox(height: 12),
        _buildBenefitItem(Icons.history, localizations.findReorder),
        const SizedBox(height: 12),
        _buildBenefitItem(Icons.local_shipping, localizations.trackPurchases),
      ],
    );
  }

  Widget _buildBenefitItem(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyle(fontSize: 16, color: Pallete.greyColor)),
      ],
    );
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'hi':
        return 'हिंदी';
      default:
        return 'English';
    }
  }
}
