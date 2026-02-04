import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/presentation/widgets/top_news_widget.dart';
import '../../../../helpers/mock_data_factory.dart';
import '../../../../helpers/test_wrappers.dart';

void main() {
  group('TopNewsWidget Widget Tests', () {
    testWidgets('displays news title correctly', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews(
        title: 'Breaking News Story',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      expect(find.text('Breaking News Story'), findsOneWidget);
      expect(find.byType(TopNewsWidget), findsOneWidget);
    });

    testWidgets('has correct container dimensions', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final containerFinder = find.byType(Container).first;
      expect(find.byType(Container), findsAtLeastNWidgets(1));

      final container = tester.widget<Container>(containerFinder);
      expect(container.constraints?.maxWidth, 120);
      expect(container.constraints?.maxHeight, 200);
    });

    testWidgets('uses Stack layout correctly', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      expect(
        find.descendant(
          of: find.byType(TopNewsWidget),
          matching: find.byType(Stack),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(TopNewsWidget),
          matching: find.byType(CachedNetworkImage),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(TopNewsWidget),
          matching: find.byType(Padding),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(TopNewsWidget),
          matching: find.byType(Text),
        ),
        findsOneWidget,
      );
    });

    testWidgets('applies correct text styling', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final textWidget = tester.widget<Text>(find.text(mockNews.title));
      expect(textWidget.maxLines, 3);
      expect(textWidget.overflow, TextOverflow.ellipsis);

      final textStyle = textWidget.style;
      expect(textStyle?.color, Colors.white);
      expect(textStyle?.fontWeight, FontWeight.bold);
    });

    testWidgets('has correct padding for text overlay', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final paddingWidget = tester.widget<Padding>(find.byType(Padding).last);
      expect(paddingWidget.padding, const EdgeInsets.all(8.0));
    });

    testWidgets('Stack alignment is bottomCenter', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final stackWidget = tester.widget<Stack>(
        find.descendant(
          of: find.byType(TopNewsWidget),
          matching: find.byType(Stack),
        ),
      );
      expect(stackWidget.alignment, Alignment.bottomCenter);
    });

    testWidgets('handles long title with truncation', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews(
        title:
            'This is an extremely long breaking news title that should definitely be truncated with ellipsis when displayed in the top news widget',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      expect(find.text(mockNews.title), findsOneWidget);

      final textWidget = tester.widget<Text>(find.text(mockNews.title));
      expect(textWidget.maxLines, 3);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('CachedNetworkImage has correct properties', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews(
        imageUrl: 'https://example.com/test-image.jpg',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final imageWidget = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(imageWidget.imageUrl, 'https://example.com/test-image.jpg');
      expect(imageWidget.width, double.infinity);
      expect(imageWidget.height, double.infinity);
      expect(imageWidget.fit, BoxFit.cover);
    });

    testWidgets('applies image color overlay', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final imageWidget = tester.widget<CachedNetworkImage>(
        find.byType(CachedNetworkImage),
      );
      expect(imageWidget.color, Colors.black.withValues(alpha: 0.4));
      expect(imageWidget.colorBlendMode, BlendMode.darken);
    });

    testWidgets('responds to theme changes', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      // Test with light theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.light,
          child: TopNewsWidget(newsData: mockNews),
        ),
      );

      expect(find.byType(TopNewsWidget), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.dark,
          child: TopNewsWidget(newsData: mockNews),
        ),
      );

      expect(find.byType(TopNewsWidget), findsOneWidget);
    });

    testWidgets('has correct decoration', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final containerWidget = tester.widget<Container>(
        find.byType(Container).first,
      );
      final decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.color, isNotNull);
    });

    testWidgets('handles special characters in title', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews(
        title: 'Breaking: "Crisis" at @Company #News! ©®™',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      expect(
        find.text('Breaking: "Crisis" at @Company #News! ©®™'),
        findsOneWidget,
      );
    });

    testWidgets('handles empty title gracefully', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews(title: '');

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      expect(find.text(''), findsOneWidget);
      expect(find.byType(TopNewsWidget), findsOneWidget);
    });

    testWidgets('Stack contains exactly two children', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final stackWidget = tester.widget<Stack>(find.byType(Stack).first);
      expect(stackWidget.children.length, 2); // Image and text overlay
    });

    testWidgets('text is wrapped in Padding', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      expect(find.byType(Padding), findsOneWidget);

      final paddingWidget = tester.widget<Padding>(find.byType(Padding).last);
      expect(paddingWidget.child, isA<Text>());
    });

    testWidgets('maintains aspect ratio', (tester) async {
      final mockNews = MockNewsFactory.createFeaturedNews();

      await tester.pumpWidget(
        TestAppWrapper(child: TopNewsWidget(newsData: mockNews)),
      );

      final containerWidget = tester.widget<Container>(
        find.byType(Container).first,
      );
      final constraints = containerWidget.constraints;
      expect(constraints?.maxWidth, 120);
      expect(constraints?.maxHeight, 200);

      // Verify the aspect ratio is approximately 2:3 (width:height)
      final aspectRatio = 120 / 200;
      expect(aspectRatio, closeTo(0.6, 0.01));
    });
  });
}
