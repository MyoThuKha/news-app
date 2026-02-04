import 'package:flutter/material.dart';

/// Wrapper widget for testing with MaterialApp
class TestAppWrapper extends StatelessWidget {

  const TestAppWrapper({
    super.key,
    required this.child,
    this.themeMode = ThemeMode.light,
  });
  final Widget child;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(body: child),
    );
  }
}

/// Test wrapper with custom theme data
class TestThemedWrapper extends StatelessWidget {

  const TestThemedWrapper({
    super.key,
    required this.child,
    this.theme,
    this.darkTheme,
  });
  final Widget child;
  final ThemeData? theme;
  final ThemeData? darkTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme ?? ThemeData.light(),
      darkTheme: darkTheme ?? ThemeData.dark(),
      home: Scaffold(body: child),
    );
  }
}

/// Simple wrapper without Scaffold for widgets that provide their own scaffold
class TestPlainWrapper extends StatelessWidget {

  const TestPlainWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.light(), home: child);
  }
}
