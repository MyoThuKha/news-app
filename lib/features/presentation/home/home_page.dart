import 'package:flutter/material.dart';
import 'package:news/features/news/presentation/pages/news_page.dart';
import 'package:news/features/saves/presentation/pages/saved_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  final _pages = const [NewsPage(), SavedNewsPage()];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: ListenableBuilder(
        listenable: _pageController,
        builder: (context, child) {
          return BottomNavigationBar(
            currentIndex: _pageController.page?.toInt() ?? 0,
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Saved',
              ),
            ],
          );
        },
      ),
    );
  }
}
