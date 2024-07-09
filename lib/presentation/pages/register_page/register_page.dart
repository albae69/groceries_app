import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/config/theme/theme.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/presentation/providers/router/router_provider.dart';
import 'package:groceries_app/presentation/widgets/text_edit_template.dart';

class RegisterPage extends ConsumerWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/bg_auth.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(30),
                    Center(
                      child: Image.asset(
                        'assets/ic_logo_colored.png',
                        height: 47.84,
                        width: 55.64,
                      ),
                    ),
                    verticalSpace(100),
                    const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: ThemeConfig.blackColor),
                    ),
                    const Text(
                      'Enter credentials to continue',
                      style: TextStyle(
                        color: ThemeConfig.greyColor,
                        fontSize: 16,
                      ),
                    ),
                    verticalSpace(40),
                    TextEditTemplate(
                        labelText: 'Username',
                        controller: email,
                        obsecureText: false),
                    verticalSpace(30),
                    TextEditTemplate(
                        labelText: 'Email',
                        controller: email,
                        obsecureText: false),
                    verticalSpace(30),
                    TextEditTemplate(
                        labelText: 'Password',
                        controller: password,
                        obsecureText: true),
                    verticalSpace(20),
                    Text(
                      'By continuing you agree to our Temrs of Service and Privacy Policy.',
                      style: TextStyle(fontSize: 12),
                    ),
                    verticalSpace(30),
                    Container(
                      height: 57,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: ThemeConfig.primaryColor),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            ref.watch(routerProvider).pushNamed('login');
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: ThemeConfig.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
