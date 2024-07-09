import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/presentation/providers/router/router_provider.dart';
import 'package:groceries_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (prev, next) {
      print('userDataProvider prev: $prev');
      print('userDataProvider next: $next');
    });

    void onLogout() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(Config.isLoggedIn, false);
      prefs.setString(Config.token, '');
      const AsyncData(null);
      ref.read(routerProvider).replaceNamed('splash');
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello, ${ref.read(userDataProvider).value?.name}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpace(30),
            Container(
              height: 57,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onLogout,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: ThemeConfig.primaryColor),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
