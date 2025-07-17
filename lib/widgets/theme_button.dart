// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final bool isDark;
  final VoidCallback Theme;

  const ThemeButton({super.key, required this.isDark, required this.Theme});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: Theme,
    );
  }
}
