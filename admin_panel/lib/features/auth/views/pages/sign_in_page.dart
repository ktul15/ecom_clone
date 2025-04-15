import 'package:admin_panel/core/utils/util_functions.dart';
import 'package:admin_panel/features/auth/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(
      authViewModelProvider.select((user) => user?.isLoading == true),
    );

    ref.listen(authViewModelProvider, (previous, next) {
      next?.when(
        data: (_) {
          showSnackBar(context, "Successfully signed in!");
          // context.goNamed(HomePage.route);
        },
        error: (error, stackTrace) {
          showSnackBar(context, error.toString());
        },
        loading: () {},
      );
    });

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Sign In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Must not be empty";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Must not be empty";
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                emailController.text = "admin@mailinator.com";
                passwordController.text = "123456";
                // Handle sign in logic
                if (_formKey.currentState!.validate()) {
                  // Perform sign in action
                  // For example, call a sign-in method from your view model
                  FocusScope.of(context).requestFocus(FocusNode());
                  await ref
                      .read(authViewModelProvider.notifier)
                      .login(emailController.text, passwordController.text);
                }
              },
              child:
                  isLoading == true
                      ? Center(child: CircularProgressIndicator.adaptive())
                      : const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
