import 'package:flutter/material.dart';
import 'package:groceries_app/config/theme/theme.dart';

class TextEditTemplate extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obsecureText;

  const TextEditTemplate(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: ThemeConfig.greyColor,
          fontSize: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ThemeConfig.grayColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ThemeConfig.grayColor,
          ),
        ),
      ),
    );
  }
}
