import 'package:client/core/localization/app_localizations.dart';
import 'package:client/core/router/route_paths.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:client/core/theme/app_text_styles.dart';
import 'package:client/features/auth/view_models/auth_view_model.dart';
import 'package:client/features/auth/views/widgets/common_button.dart';
import 'package:client/features/auth/views/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInOrCreateAccountPage extends ConsumerStatefulWidget {
  const SignInOrCreateAccountPage({super.key});

  static get route => RoutePaths.signIn;

  @override
  ConsumerState<SignInOrCreateAccountPage> createState() =>
      _SignInOrCreateAccountPageState();
}

class _SignInOrCreateAccountPageState
    extends ConsumerState<SignInOrCreateAccountPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (_) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Successfully signed in.")));
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (_) => LoginPage()),
          // );
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(error.toString())));
        },
        loading: () {},
      );
    });

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Pallete.lightGreyColor,
                boxShadow: [BoxShadow(color: Pallete.greyColor, blurRadius: 1)],
              ),
              child: Text("Amazon.in logo"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.signInOrCreateAccount,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.title,
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.enterEmail,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.subtitle,
                    ),
                  ),
                  SizedBox(height: 4),
                  CommonTextField(controller: emailController),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      localizations.enterPassword,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.subtitle,
                    ),
                  ),
                  SizedBox(height: 4),
                  CommonTextField(
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 12),
                  CommonButton.primaryRounded(
                    title: localizations.continueButton,
                    fontSize: 16,
                    onPressed: () async {
                      await ref
                          .read(authViewModelProvider.notifier)
                          .signUp(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      // =>
                      //     context.goNamed(
                      //       HomePage.route,
                      //       extra: {"fromContinue": true},
                      //     )
                    },
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: localizations.agreeToTerms,
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                            text: " ${localizations.conditionsOfUse}",
                            style: AppTextStyles.link,
                          ),
                          TextSpan(
                            text: " ${localizations.and}",
                            style: AppTextStyles.body,
                          ),
                          TextSpan(
                            text: " ${localizations.privacyNotice}",
                            style: AppTextStyles.link,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Pallete.lightGreyColor),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(localizations.conditionsOfUse, style: AppTextStyles.link),
                Text(localizations.privacyNotice, style: AppTextStyles.link),
                Text(localizations.help, style: AppTextStyles.link),
              ],
            ),
            SizedBox(height: 16),
            Text(localizations.footerText, style: AppTextStyles.footer),
          ],
        ),
      ),
    );
  }
}
