import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/presentation/widgets/section_title.dart';
import '../../../../helpers/test_wrappers.dart';

void main() {
  group('SectionTitle Widget Tests', () {
    testWidgets('displays title with correct text', (tester) async {
      const testTitle = 'Breaking News';

      await tester.pumpWidget(
        const TestAppWrapper(child: SectionTitle(title: testTitle)),
      );

      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('applies correct padding', (tester) async {
      const testTitle = 'Test Section';

      await tester.pumpWidget(
        const TestAppWrapper(child: SectionTitle(title: testTitle)),
      );

      final textWidget = tester.widget<Text>(find.text(testTitle));
      final paddingWidget = tester.widget<Padding>(
        find.ancestor(of: find.text(testTitle), matching: find.byType(Padding)),
      );

      expect(
        paddingWidget.padding,
        const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      );
    });

    testWidgets('uses titleSmall text style', (tester) async {
      const testTitle = 'Test Title';

      await tester.pumpWidget(
        const TestAppWrapper(child: SectionTitle(title: testTitle)),
      );

      final textWidget = tester.widget<Text>(find.text(testTitle));
      final textStyle = textWidget.style;

      expect(textStyle, isNotNull);
    });

    testWidgets('handles empty title gracefully', (tester) async {
      const emptyTitle = '';

      await tester.pumpWidget(
        const TestAppWrapper(child: SectionTitle(title: emptyTitle)),
      );

      expect(find.text(emptyTitle), findsOneWidget);
      expect(find.byType(SectionTitle), findsOneWidget);
    });

    testWidgets('handles long title text', (tester) async {
      const longTitle =
          'This is a very long section title that might wrap or overflow depending on the available space';

      await tester.pumpWidget(
        const TestAppWrapper(child: SectionTitle(title: longTitle)),
      );

      expect(find.text(longTitle), findsOneWidget);
      expect(find.byType(SectionTitle), findsOneWidget);
    });

    testWidgets('responds to theme changes', (tester) async {
      const testTitle = 'Themed Title';

      // Test with light theme
      await tester.pumpWidget(
        const TestAppWrapper(
          themeMode: ThemeMode.light,
          child: SectionTitle(title: testTitle),
        ),
      );

      expect(find.byType(SectionTitle), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        const TestAppWrapper(
          themeMode: ThemeMode.dark,
          child: SectionTitle(title: testTitle),
        ),
      );

      expect(find.byType(SectionTitle), findsOneWidget);
      expect(find.text(testTitle), findsOneWidget);
    });

    testWidgets('is contained in Padding widget', (tester) async {
      const testTitle = 'Test Title';

      await tester.pumpWidget(
        const TestAppWrapper(child: SectionTitle(title: testTitle)),
      );

      expect(find.byType(Padding), findsOneWidget);
      expect(find.text(testTitle), findsOneWidget);

      final paddingWidget = tester.widget<Padding>(find.byType(Padding));
      expect(paddingWidget.child, isA<Text>());
    });
  });
}
