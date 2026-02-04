import 'package:flutter/material.dart';
import 'package:news/features/news/presentation/pages/news_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  NewsPage.route: (context) => const NewsPage(),
};
