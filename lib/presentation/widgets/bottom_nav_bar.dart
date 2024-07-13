import 'package:flutter/material.dart';
import 'package:groceries_app/presentation/widgets/bottom_nav_bar_item.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavBarItem> items;
  final void Function(int index) onTap;
  final int selectedIndex;

  const BottomNavBar(
      {super.key,
      required this.items,
      required this.onTap,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items
              .map((e) => GestureDetector(
                    onTap: () => onTap(e.index),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
