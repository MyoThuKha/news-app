import 'package:flutter/material.dart';
import 'package:news/config/routes/routes.dart';
import 'package:news/config/themes/light_theme.dart';
import 'package:news/features/news/presentation/pages/news_page.dart';
import 'package:news/injection/injection_container.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: LightTheme().themeData,
      initialRoute: NewsPage.route,
      routes: routes,
    );
  }
}

