import 'package:flutter/material.dart';
import 'package:news/config/themes/app_theme_mode.dart';

abstract class AppTheme {
  ThemeData get themeData;
  AppThemeMode get mode;
}
