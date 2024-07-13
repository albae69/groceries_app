import 'package:flutter/material.dart';
import 'package:groceries_app/config/config.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final String icon;
  final String selectedIcon;

  const BottomNavBarItem(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.title,
      required this.icon,
      required this.selectedIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(isSelected ? selectedIcon : icon),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? ThemeConfig.primaryColor
                  : ThemeConfig.blackColor),
        )
      ],
    );
  }
}
