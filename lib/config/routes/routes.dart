import 'package:flutter/material.dart';
import 'package:news/features/presentation/home/home_page.dart';
import 'package:news/features/news/presentation/pages/details_page.dart';
import 'package:news/features/news/presentation/pages/news_page.dart';
import 'package:news/features/saves/presentation/pages/saved_news_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  HomePage.route: (context) => const HomePage(),
  NewsPage.route: (context) => const NewsPage(),
  DetailsPage.route: (context) => const DetailsPage(),
  SavedNewsPage.route: (context) => const SavedNewsPage(),
};
