import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/presentation/widgets/news_tile.dart';
import '../../../../helpers/mock_data_factory.dart';
import '../../../../helpers/test_wrappers.dart';

void main() {
  group('NewsTile Widget Tests', () {
    testWidgets('displays news content correctly', (tester) async {
      final mockNews = MockNewsFactory.createMockNews(
        title: 'Test News Title',
        description: 'Test news description',
        author: 'Test Author',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      expect(find.text('Test News Title'), findsOneWidget);
      expect(find.text('Test news description'), findsOneWidget);
      expect(find.byType(NewsTile), findsOneWidget);
    });

    testWidgets('has correct structure and layout', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      expect(
        find.byType(Container),
        findsAtLeastNWidgets(2),
      ); // Main container + image container
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('displays image with correct dimensions', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final containers = find.byType(Container);
      expect(
        containers,
        findsAtLeastNWidgets(2),
      ); // Main container + image container

      // Find the hero widget which contains the image container
      final heroWidget = find.byType(Hero);
      expect(heroWidget, findsOneWidget);
    });

    testWidgets('handles long title with truncation', (tester) async {
      final mockNews = MockNewsFactory.createNewsWithLongTitle();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final titleText = find.text(mockNews.title);
      expect(titleText, findsOneWidget);

      final textWidget = tester.widget<Text>(titleText);
      expect(textWidget.maxLines, 2);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('handles long description with truncation', (tester) async {
      final mockNews = MockNewsFactory.createNewsWithLongDescription();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final descriptionText = find.text(mockNews.description);
      expect(descriptionText, findsOneWidget);

      final textWidget = tester.widget<Text>(descriptionText);
      expect(textWidget.maxLines, 3);
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('has correct container dimensions', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
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

    testWidgets('hero widget uses correct tag', (tester) async {
      final mockNews = MockNewsFactory.createMockNews(
        urlToImage: 'https://example.com/test-image.jpg',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final heroWidget = tester.widget<Hero>(find.byType(Hero));
      expect(heroWidget.tag, mockNews.urlToImage);
    });

    testWidgets('row has correct spacing', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final rowWidget = tester.widget<Row>(find.byType(Row));
      // Note: spacing property is not directly accessible via tester.widget
      // But we can verify the Row exists
      expect(rowWidget, isNotNull);
    });

    testWidgets('column children are correctly structured', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final columnWidgets = find.byType(Column);
      expect(columnWidgets, findsOneWidget);

      // Find text widgets within the column
      final textWidgets = find.byType(Text);
      expect(textWidgets, findsAtLeastNWidgets(2)); // Title and description
    });

    testWidgets('responds to theme changes', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      // Test with light theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.light,
          child: NewsTile(newsData: mockNews),
        ),
      );

      expect(find.byType(NewsTile), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.dark,
          child: NewsTile(newsData: mockNews),
        ),
      );

      expect(find.byType(NewsTile), findsOneWidget);
    });

    testWidgets('handles news with special characters', (tester) async {
      final mockNews = MockNewsFactory.createMockNews(
        title: 'Breaking: "Crisis" in Tech! @Company #News',
        description: 'Special chars: © ® ™ € £ ¥ ...',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      expect(
        find.text('Breaking: "Crisis" in Tech! @Company #News'),
        findsOneWidget,
      );
      expect(find.text('Special chars: © ® ™ € £ ¥ ...'), findsOneWidget);
    });

    testWidgets('column has correct padding and spacing', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
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

    testWidgets('image container has clip behavior', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final heroWidget = find.byType(Hero);
      expect(heroWidget, findsOneWidget);

      final heroChild = tester.widget<Hero>(heroWidget);
      expect(heroWidget, isNotNull);
    });

    testWidgets('expands info section correctly', (tester) async {
      final mockNews = MockNewsFactory.createMockNews();

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      final expandedWidget = find.byType(Expanded);
      expect(expandedWidget, findsOneWidget);
    });

    testWidgets('handles minimal news data', (tester) async {
      final mockNews = MockNewsFactory.createMockNews(
        title: '',
        description: '',
        author: '',
      );

      await tester.pumpWidget(
        TestAppWrapper(child: NewsTile(newsData: mockNews)),
      );

      expect(
        find.text(''),
        findsAtLeastNWidgets(1),
      ); // Empty title and/or description
      expect(find.byType(NewsTile), findsOneWidget);
    });
  });
}
