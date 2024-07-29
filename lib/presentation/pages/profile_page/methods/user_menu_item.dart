import 'package:flutter/material.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/presentation/misc/methods.dart';

Widget userMenuItem(String title, {VoidCallback? onTap, String? leftIcon}) =>
    InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Divider(height: 0),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // left icon
                  Image.asset(leftIcon ?? 'assets/ic_orders.png'),

                  horizontalSpace(20),

                  // title
                  Text(
                    title,
                    style: TextStyle(
                        color: ThemeConfig.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // right icon
              Image.asset('assets/ic_chevron_right.png')
            ],
          ),
          verticalSpace(20),
          Divider(height: 0),
        ],
      ),
    );
