import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/presentation/pages/cart_page/cart_page.dart';
import 'package:groceries_app/presentation/pages/explore_page/explore_page.dart';
import 'package:groceries_app/presentation/pages/favorite_page/favorite_page.dart';
import 'package:groceries_app/presentation/pages/profile_page/profile_page.dart';
import 'package:groceries_app/presentation/pages/shop_page/shop_page.dart';
import 'package:groceries_app/presentation/providers/user_data/user_data_provider.dart';
import 'package:groceries_app/presentation/widgets/bottom_nav_bar.dart';
import 'package:groceries_app/presentation/widgets/bottom_nav_bar_item.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(userDataProvider, (prev, next) {
      print('userDataProvider prev: $prev');
      print('userDataProvider next: $next');
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) => setState(() {
                selectedPage = value;
              }),
              children: [
                Center(
                  child: ShopPage(),
                ),
                const Center(
                  child: ExplorePage(),
                ),
                const Center(
                  child: CartPage(),
                ),
                const Center(
                  child: FavoritePage(),
                ),
                const Center(
                  child: ProfilePage(),
                ),
              ],
            ),
            BottomNavBar(
              items: [
                BottomNavBarItem(
                  index: 0,
                  isSelected: selectedPage == 0,
                  title: 'Shop',
                  icon: 'assets/ic_shop.png',
                  selectedIcon: 'assets/ic_shop_selected.png',
                ),
                BottomNavBarItem(
                  index: 1,
                  isSelected: selectedPage == 1,
                  title: 'Explore',
                  icon: 'assets/ic_explore.png',
                  selectedIcon: 'assets/ic_explore_selected.png',
                ),
                BottomNavBarItem(
                  index: 2,
                  isSelected: selectedPage == 2,
                  title: 'Cart',
                  icon: 'assets/ic_cart.png',
                  selectedIcon: 'assets/ic_cart_selected.png',
                ),
                BottomNavBarItem(
                  index: 3,
                  isSelected: selectedPage == 3,
                  title: 'Favorite',
                  icon: 'assets/ic_favorite.png',
                  selectedIcon: 'assets/ic_favorite_selected.png',
                ),
                BottomNavBarItem(
                  index: 4,
                  isSelected: selectedPage == 4,
                  title: 'Account',
                  icon: 'assets/ic_account.png',
                  selectedIcon: 'assets/ic_account_selected.png',
                ),
              ],
              selectedIndex: selectedPage,
              onTap: (index) {
                selectedPage = index;
                pageController.animateToPage(
                  selectedPage,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
