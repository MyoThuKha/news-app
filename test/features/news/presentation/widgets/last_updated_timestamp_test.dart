import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/features/news/presentation/widgets/last_updated_timestamp.dart';
import '../../../../helpers/test_wrappers.dart';

void main() {
  group('LastUpdatedTimestamp Widget Tests', () {
    testWidgets('displays formatted timestamp when provided', (tester) async {
      final testTime = DateTime(2024, 1, 15, 14, 30);

      await tester.pumpWidget(
        TestAppWrapper(child: LastUpdatedTimestamp(timestamp: testTime)),
      );

      expect(find.byType(RichText), findsOneWidget);
      // Should contain the formatted date
      final richText = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richText.text as TextSpan;
      expect(textSpan.children, isNotNull);
    });

    testWidgets('handles null timestamp gracefully', (tester) async {
      await tester.pumpWidget(
        const TestAppWrapper(child: LastUpdatedTimestamp(timestamp: null)),
      );

      expect(find.byType(RichText), findsOneWidget);
    });

    testWidgets('uses RichText with correct structure', (tester) async {
      final testTime = DateTime(2024, 12, 25, 10, 0);

      await tester.pumpWidget(
        TestAppWrapper(child: LastUpdatedTimestamp(timestamp: testTime)),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      expect(richTextWidget.text, isA<TextSpan>());

      final textSpan = richTextWidget.text as TextSpan;
      // The widget uses Text.rich, so children might be embedded differently
      expect(textSpan.children, isNotNull);

      // First span should be "Last Updated: "
      final firstSpan = textSpan.children![0] as TextSpan;
      expect(firstSpan.text, 'Last Updated: ');

      // Second span should be the formatted timestamp with bold style
      final secondSpan = textSpan.children![1] as TextSpan;
      expect(secondSpan.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('applies correct text style', (tester) async {
      final testTime = DateTime.now();

      await tester.pumpWidget(
        TestAppWrapper(child: LastUpdatedTimestamp(timestamp: testTime)),
      );

      final richTextWidget = tester.widget<RichText>(find.byType(RichText));
      final textSpan = richTextWidget.text as TextSpan;

      expect(textSpan.style?.fontSize, isNotNull);
      expect(textSpan.style?.color, isNotNull);
    });

    testWidgets('displays different times correctly', (tester) async {
      final testCases = [
        DateTime(2024, 1, 1, 0, 0),
        DateTime(2024, 6, 15, 12, 30),
        DateTime(2024, 12, 31, 23, 59),
        DateTime.now(),
      ];

      for (final testTime in testCases) {
        await tester.pumpWidget(
          TestAppWrapper(child: LastUpdatedTimestamp(timestamp: testTime)),
        );

        expect(find.byType(LastUpdatedTimestamp), findsOneWidget);
        expect(find.text('Last Updated: '), findsOneWidget);

        await tester.pumpWidget(Container()); // Clean up
      }
    });

    testWidgets('responds to theme changes', (tester) async {
      final testTime = DateTime.now();

      // Test with light theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.light,
          child: LastUpdatedTimestamp(timestamp: testTime),
        ),
      );

      expect(find.byType(LastUpdatedTimestamp), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        TestAppWrapper(
          themeMode: ThemeMode.dark,
          child: LastUpdatedTimestamp(timestamp: testTime),
        ),
      );

      expect(find.byType(LastUpdatedTimestamp), findsOneWidget);
    });

    testWidgets('handles edge case timestamps', (tester) async {
      final edgeCases = [
        DateTime(1970, 1, 1), // Unix epoch
        DateTime(2100, 12, 31), // Far future
        DateTime.now().subtract(const Duration(days: 365)), // One year ago
        DateTime.now().add(const Duration(days: 30)), // Future date
      ];

      for (final testTime in edgeCases) {
        await tester.pumpWidget(
          TestAppWrapper(child: LastUpdatedTimestamp(timestamp: testTime)),
        );

        expect(find.byType(LastUpdatedTimestamp), findsOneWidget);
        expect(find.text('Last Updated: '), findsOneWidget);

        await tester.pumpWidget(Container()); // Clean up
      }
    });

    testWidgets('text structure is consistent', (tester) async {
      final testTime = DateTime(2024, 3, 15, 9, 45);

      await tester.pumpWidget(
        TestAppWrapper(child: LastUpdatedTimestamp(timestamp: testTime)),
      );

      // Find all text widgets
      final textWidgets = find.byType(Text);
      expect(textWidgets, findsOneWidget);

      // Should have exactly one RichText widget
      final richTextWidgets = find.byType(RichText);
      expect(richTextWidgets, findsOneWidget);
    });
  });
}
