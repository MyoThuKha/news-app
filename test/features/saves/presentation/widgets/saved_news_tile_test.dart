import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/saves/presentation/widgets/saved_news_tile.dart';
import '../../../../helpers/mock_data_factory.dart';
import '../../../../helpers/test_wrappers.dart';

void main() {
  group('SavedNewsTile Widget Tests', () {
    testWidgets('displays saved news content correctly', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      expect(find.text(mockSavedNews.news.title), findsOneWidget);
      expect(find.text(mockSavedNews.news.description), findsOneWidget);
      expect(find.byType(SavedNewsTile), findsOneWidget);
    });

    testWidgets('has correct structure and layout', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      expect(find.byType(Container), findsAtLeastNWidgets(2));
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('hero widget uses correct tag from nested news entity', (
      tester,
    ) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews(
        news: MockNewsFactory.createMockNews(
          urlToImage: 'https://example.com/saved-image.jpg',
        ),
      );

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final heroWidget = tester.widget<Hero>(find.byType(Hero));
      expect(heroWidget.tag, mockSavedNews.news.urlToImage);
    });

    testWidgets('displays image with correct dimensions', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final imageWidget = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(imageWidget.width, 120);
      expect(imageWidget.height, double.infinity);
      expect(imageWidget.fit, BoxFit.cover);
    });

    testWidgets('uses correct image URL from nested news entity', (
      tester,
    ) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews(
        news: MockNewsFactory.createMockNews(
          urlToImage: 'https://example.com/test-saved-news.jpg',
        ),
      );

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final imageWidget = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(imageWidget.imageUrl, 'https://example.com/test-saved-news.jpg');
    });

    testWidgets('handles long title with truncation', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews(
        news: MockNewsFactory.createNewsWithLongTitle(),
      );

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final titleText = find.text(mockSavedNews.news.title);
      expect(titleText, findsOneWidget);

      final textWidget = tester.widget<Text>(titleText);
      expect(textWidget.maxLines, 2);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('handles long description with truncation', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews(
        news: MockNewsFactory.createNewsWithLongDescription(),
      );

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final descriptionText = find.text(mockSavedNews.news.description);
      expect(descriptionText, findsOneWidget);

      final textWidget = tester.widget<Text>(descriptionText);
      expect(textWidget.maxLines, 3);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('has correct container dimensions and padding', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final mainContainer = find.byType(Container).first;
      final containerWidget = tester.widget<Container>(mainContainer);

      expect(containerWidget.constraints, isNotNull);
      expect(containerWidget.padding, const EdgeInsets.all(5));

      final decoration = containerWidget.decoration as BoxDecoration;
      expect(
        decoration.borderRadius,
        const BorderRadius.all(Radius.circular(20)),
      );
    });

    testWidgets('column has correct padding and spacing', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final expandedWidget = tester.widget<Expanded>(find.byType(Expanded));
      expect(expandedWidget.child, isA<Padding>());

      final paddingWidget = tester.widget<Padding>(
        find.descendant(
          of: find.byType(Expanded),
          matching: find.byType(Padding),
        ),
      );
      expect(
        paddingWidget.padding,
        const EdgeInsets.only(top: 15, bottom: 15, right: 10),
      );
    });

    testWidgets('responds to theme changes', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      // Test with light theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.light,
          child: SavedNewsTile(newsData: mockSavedNews),
        ),
      );

      expect(find.byType(SavedNewsTile), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.dark,
          child: SavedNewsTile(newsData: mockSavedNews),
        ),
      );

      expect(find.byType(SavedNewsTile), findsOneWidget);
    });

    testWidgets('handles saved news with special characters', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews(
        news: MockNewsFactory.createMockNews(
          title: 'Saved: "Important" News @User #Saved! ©®™',
          description: 'Special chars description with émojis 🎉',
        ),
      );

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      expect(
        find.text('Saved: "Important" News @User #Saved! ©®™'),
        findsOneWidget,
      );
      expect(
        find.text('Special chars description with émojis 🎉'),
        findsOneWidget,
      );
    });

    testWidgets('expands info section correctly', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final expandedWidget = find.byType(Expanded);
      expect(expandedWidget, findsOneWidget);
    });

    testWidgets('handles empty nested news data', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews(
        news: MockNewsFactory.createMockNews(
          title: '',
          description: '',
          author: '',
        ),
      );

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      expect(find.text(''), findsAtLeastNWidgets(1));
      expect(find.byType(SavedNewsTile), findsOneWidget);
    });

    testWidgets('row has correct layout structure', (tester) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final rowWidget = tester.widget<Row>(find.byType(Row));
      expect(
        rowWidget.children.length,
        2,
      ); // Image container and expanded section
    });

    testWidgets('column contains title and description text widgets', (
      tester,
    ) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      final columnWidgets = find.byType(Column);
      expect(columnWidgets, findsOneWidget);

      // Find text widgets within the column
      final textWidgets = find.byType(Text);
      expect(textWidgets, findsAtLeastNWidgets(2)); // Title and description
    });

    testWidgets('maintains consistency with NewsTile structure', (
      tester,
    ) async {
      final mockSavedNews = MockSavedNewsFactory.createMockSavedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
      );

      // Should have same structure as NewsTile
      expect(find.byType(Container), findsAtLeastNWidgets(2));
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
      expect(find.byType(Padding), findsAtLeastNWidgets(2));
    });

    testWidgets('different savedAt times do not affect display', (
      tester,
    ) async {
      final testCases = [
        DateTime.now().subtract(const Duration(minutes: 5)),
        DateTime.now().subtract(const Duration(hours: 1)),
        DateTime.now().subtract(const Duration(days: 1)),
      ];

      for (final savedAt in testCases) {
        final mockSavedNews = MockSavedNewsFactory.createSavedNewsWithTimestamp(
          savedAt: savedAt,
        );

        await tester.pumpWidget(
          TestAppWrapper(child: SavedNewsTile(newsData: mockSavedNews)),
        );

        expect(find.byType(SavedNewsTile), findsOneWidget);
        expect(find.text(mockSavedNews.news.title), findsOneWidget);

        await tester.pumpWidget(Container()); // Clean up
      }
    });
  });
}
