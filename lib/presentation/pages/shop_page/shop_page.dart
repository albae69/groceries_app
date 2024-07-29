import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/config/theme/theme.dart';
import 'package:groceries_app/presentation/widgets/search_text_edit.dart';

class ShopPage extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();

  ShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/ic_logo_colored.png',
                      height: 30,
                      width: 26,
                    ),
                    verticalSpace(8),
                    // location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/ic_gps.png', height: 15, width: 18),
                        horizontalSpace(8),
                        const Text('Medan, North Sumatera',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ThemeConfig.gray2Color,
                            )),
                      ],
                    ),
                    verticalSpace(20),
                    // search input
                    SearchTextEdit(
                      placeholderText: 'Search Store',
                      controller: searchController,
                    ),
                    verticalSpace(20),
                    // promo slider
                    // exclusive offer
                    // best selling
                    // groceries
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
