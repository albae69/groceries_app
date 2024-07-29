import 'package:flutter/material.dart';
import 'package:groceries_app/config/theme/theme.dart';

class SearchTextEdit extends StatelessWidget {
  final String placeholderText;
  final TextEditingController controller;

  const SearchTextEdit({
    super.key,
    required this.placeholderText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholderText,
        prefixIcon: Image.asset('assets/ic_search.png', height: 18, width: 18),
        filled: true,
        fillColor: ThemeConfig.secondaryColor,
        labelStyle: TextStyle(
          color: ThemeConfig.greyColor,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }
}
