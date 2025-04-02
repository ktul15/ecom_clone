import 'package:client/core/localization/app_localizations.dart';
import 'package:client/core/router/route_paths.dart';
import 'package:client/core/theme/app_text_styles.dart';
import 'package:client/features/auth/views/pages/sign_in_or_create_account_page.dart';
import 'package:client/features/auth/views/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  static get route => RoutePaths.welcome;

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
                  style: AppTextStyles.bigTitle,
                ),
                const SizedBox(height: 24),
                _buildBenefitsList(context),
                const SizedBox(height: 32),
                CommonButton.primary(
                  title: localizations.signInButton,
                  onPressed:
                      () => context.pushNamed(SignInOrCreateAccountPage.route),
                ),
                const SizedBox(height: 12),
                CommonButton.grayed(
                  title: localizations.createAccountButton,
                  onPressed:
                      () => context.pushNamed(SignInOrCreateAccountPage.route),
                ),
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
      children: [Text(text, style: AppTextStyles.subtitle)],
    );
  }
}
