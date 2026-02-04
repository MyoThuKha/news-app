import 'package:flutter/material.dart';

enum AppThemeMode {
  light(data: .light),
  dark(data: .dark),
  system(data: .system);

  const AppThemeMode({required this.data});

  final ThemeMode data;
}
