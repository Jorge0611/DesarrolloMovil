// Custom theme for the app with hex color code

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent));
  }
}
