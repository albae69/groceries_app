import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/presentation/misc/methods.dart';
import 'package:groceries_app/presentation/providers/user_data/user_data_provider.dart';

List<Widget> User(WidgetRef ref) => [
      Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 64,
                width: 64,
                child: Image.asset(
                  'assets/img_profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Image
            horizontalSpace(20),
            // Data
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ref.watch(userDataProvider)?.valueOrNull?.name ?? 'name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeConfig.blackColor,
                  ),
                ),
                Text(
                  ref.watch(userDataProvider)?.valueOrNull?.email ?? "email",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeConfig.greyColor,
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ];
