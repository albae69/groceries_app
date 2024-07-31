import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/config/theme/theme.dart';
import 'package:groceries_app/presentation/extension/build_context_extension.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/presentation/providers/router/router_provider.dart';
import 'package:groceries_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:groceries_app/presentation/widgets/text_edit_template.dart';
import 'package:groceries_app/utils/logger.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (prev, next) {
      logger.d('prev : $prev');
      logger.d('next : $next');

      if (next is AsyncData) {
        if (next.value != null) {
          logger.d('userDataProvider: ${next.value}');
          ref.read(routerProvider).goNamed('main');
          return;
        }
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
        return;
      }
    });

    void onLogin() async {
      ref.watch(userDataProvider.notifier).login(
          email: emailController.text, password: passwordController.text);
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
                      'Login',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: ThemeConfig.blackColor),
                    ),
                    const Text(
                      'Enter your email and password',
                      style: TextStyle(
                        color: ThemeConfig.greyColor,
                        fontSize: 16,
                      ),
                    ),
                    verticalSpace(40),
                    TextEditTemplate(
                        labelText: 'Email',
                        controller: emailController,
                        obsecureText: false),
                    verticalSpace(30),
                    TextEditTemplate(
                        labelText: 'Password',
                        controller: passwordController,
                        obsecureText: true),
                    verticalSpace(20),
                    Align(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: ThemeConfig.blackColor,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    verticalSpace(20),
                    Container(
                      height: 57,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: onLogin,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: ThemeConfig.primaryColor),
                          child: switch (ref.watch(userDataProvider)) {
                            AsyncLoading() => const Center(
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                ),
                              ),
                            _ => const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )
                          }),
                    ),
                    verticalSpace(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            ref.watch(routerProvider).pushNamed('register');
                          },
                          child: const Text(
                            'Register',
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
