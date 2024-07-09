import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/config/theme/theme.dart';
import 'package:groceries_app/presentation/misc/build_context_extension.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/presentation/providers/router/router_provider.dart';
import 'package:groceries_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:groceries_app/presentation/widgets/text_edit_template.dart';

class RegisterPage extends ConsumerWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (prev, next) {
      print('prev : $prev');
      print('next : $next');

      if (next is AsyncData) {
        if (next.value != null) {
          print('userDataProvider: ${next.value}');
          context.showSnackBar('Success Register!');
          ref.read(routerProvider).goNamed('login');
        }
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    });

    void onSignUp() {
      ref.read(userDataProvider.notifier).register(
          name: name.text, email: email.text, password: password.text);
    }

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
                        controller: name,
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
                          onPressed: onSignUp,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: ThemeConfig.primaryColor),
                          child: switch (ref.watch(userDataProvider)) {
                            AsyncData(value: final value) => value == null
                                ? const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Center(
                                    child: SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                    ),
                                  ),
                            _ => const Center(
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                ),
                              ),
                          }),
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
