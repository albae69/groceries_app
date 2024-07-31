import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/presentation/pages/profile_page/methods/user.dart';
import 'package:groceries_app/presentation/pages/profile_page/methods/user_menu_item.dart';
import 'package:groceries_app/presentation/providers/router/router_provider.dart';
import 'package:groceries_app/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ListView(
          children: [
            ...User(ref),
            userMenuItem('Orders', onTap: () {
              logger.d("Orders tapped");
            }),
            userMenuItem('My Details', onTap: () {
              logger.d("My Details tapped");
            }, leftIcon: 'assets/ic_my_detail.png'),
            userMenuItem('Delivery Address', leftIcon: 'assets/ic_gps.png'),
            userMenuItem('Payment Methods', leftIcon: 'assets/ic_payment.png'),
            userMenuItem('Promo Card', leftIcon: 'assets/ic_discount.png'),
            userMenuItem('Help', leftIcon: 'assets/ic_help.png'),
            userMenuItem('Notifications', leftIcon: 'assets/ic_bell.png'),
            userMenuItem('About', leftIcon: 'assets/ic_about.png'),
            verticalSpace(50),
            Container(
              height: 67,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool(Config.isLoggedIn, false);
                  prefs.setString(Config.token, '');
                  const AsyncData(null);
                  ref.read(routerProvider).replaceNamed('splash');
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: ThemeConfig.secondaryColor),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ThemeConfig.primaryColor),
                ),
              ),
            ),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
