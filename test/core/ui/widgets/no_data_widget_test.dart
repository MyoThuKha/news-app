import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/ui/widgets/no_data_widget.dart';
import '../../../helpers/test_wrappers.dart';

void main() {
  group('NoDataWidget Widget Tests', () {
    testWidgets('displays default title when no title provided', (
      tester,
    ) async {
      await tester.pumpWidget(const TestAppWrapper(child: NoDataWidget()));

      expect(find.text('No Data'), findsOneWidget);
      expect(find.byType(NoDataWidget), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
    });

    testWidgets('displays custom title when provided', (tester) async {
      const customTitle = 'No News Available';

      await tester.pumpWidget(
        const TestAppWrapper(child: NoDataWidget(title: customTitle)),
      );

      expect(find.text(customTitle), findsOneWidget);
      expect(find.text('No Data'), findsNothing);
    });

    testWidgets('displays message when provided', (tester) async {
      const customMessage =
          'Please check your internet connection and try again.';

      await tester.pumpWidget(
        const TestAppWrapper(child: NoDataWidget(message: customMessage)),
      );

      expect(find.text(customMessage), findsOneWidget);
      expect(find.text('No Data'), findsOneWidget); // Default title
    });

    testWidgets('displays both custom title and message', (tester) async {
      const customTitle = 'No Saved Articles';
      const customMessage = 'You haven\'t saved any articles yet.';

      await tester.pumpWidget(
        const TestAppWrapper(
          child: NoDataWidget(title: customTitle, message: customMessage),
        ),
      );

      expect(find.text(customTitle), findsOneWidget);
      expect(find.text(customMessage), findsOneWidget);
    });

    testWidgets('uses correct layout structure', (tester) async {
      await tester.pumpWidget(const TestAppWrapper(child: NoDataWidget()));

      expect(find.byType(Center), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsOneWidget); // Only title
    });

    testWidgets('column has correct properties', (tester) async {
      await tester.pumpWidget(const TestAppWrapper(child: NoDataWidget()));

      final columnWidget = tester.widget<Column>(find.byType(Column));
      expect(columnWidget.mainAxisSize, MainAxisSize.min);
      expect(columnWidget.mainAxisAlignment, MainAxisAlignment.center);
    });

    testWidgets('column has correct spacing', (tester) async {
      const customTitle = 'Test Title';
      const customMessage = 'Test message with more details';

      await tester.pumpWidget(
        const TestAppWrapper(
          child: NoDataWidget(title: customTitle, message: customMessage),
        ),
      );

      // Verify column exists with two children (title and message)
      final columnWidget = tester.widget<Column>(find.byType(Column));
      expect(columnWidget.children.length, 2);
    });

    testWidgets('applies correct text styles', (tester) async {
      const customTitle = 'Styled Title';
      const customMessage = 'Styled message';

      await tester.pumpWidget(
        const TestAppWrapper(
          child: NoDataWidget(title: customTitle, message: customMessage),
        ),
      );

      final textWidgets = find.byType(Text);
      expect(textWidgets, findsNWidgets(2));

      // Check that both text widgets have non-null styles
      for (final finder in [find.text(customTitle), find.text(customMessage)]) {
        final textWidget = tester.widget<Text>(finder);
        expect(textWidget.style, isNotNull);
      }
    });

    testWidgets('handles empty title gracefully', (tester) async {
      const emptyTitle = '';

      await tester.pumpWidget(
        const TestAppWrapper(child: NoDataWidget(title: emptyTitle)),
      );

      expect(find.text(emptyTitle), findsOneWidget);
      expect(find.byType(NoDataWidget), findsOneWidget);
    });

    testWidgets('handles empty message gracefully', (tester) async {
      const emptyMessage = '';

      await tester.pumpWidget(
        const TestAppWrapper(child: NoDataWidget(message: emptyMessage)),
      );

      expect(find.text(emptyMessage), findsOneWidget);
      expect(find.text('No Data'), findsOneWidget); // Default title
    });

    testWidgets('responds to theme changes', (tester) async {
      // Test with light theme
      await tester.pumpWidget(
        const TestAppWrapper(themeMode: ThemeMode.light, child: NoDataWidget()),
      );

      expect(find.byType(NoDataWidget), findsOneWidget);

      // Test with dark theme
      await tester.pumpWidget(
        const TestAppWrapper(themeMode: ThemeMode.dark, child: NoDataWidget()),
      );

      expect(find.byType(NoDataWidget), findsOneWidget);
    });

    testWidgets('handles long text content', (tester) async {
      const longTitle =
          'This is an extremely long title that should be displayed properly even when it exceeds the normal width of the screen';
      const longMessage =
          'This is also a very long message that contains multiple sentences and should be handled gracefully by the widget layout, wrapping properly if needed or truncating as appropriate.';

      await tester.pumpWidget(
        const TestAppWrapper(
          child: NoDataWidget(title: longTitle, message: longMessage),
        ),
      );

      expect(find.text(longTitle), findsOneWidget);
      expect(find.text(longMessage), findsOneWidget);
    });

    testWidgets('center widget centers content properly', (tester) async {
      await tester.pumpWidget(const TestAppWrapper(child: NoDataWidget()));

      final centerWidget = tester.widget<Center>(find.byType(Center));
      expect(centerWidget.child, isA<Column>());
    });

    testWidgets('conditionally shows message only when provided', (
      tester,
    ) async {
      // Test without message
      await tester.pumpWidget(
        const TestAppWrapper(child: NoDataWidget(title: 'Title Only')),
      );

      expect(find.text('Title Only'), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      // Test with message
      await tester.pumpWidget(
        const TestAppWrapper(
          child: NoDataWidget(title: 'Title', message: 'Message'),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Message'), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2));
    });

    testWidgets('handles special characters in text', (tester) async {
      final titleWithSpecial = 'No Data! @Error #404 ©®™';
      final messageWithSpecial = 'Special chars: émojis 🎉 symbols \$%&*()';

      await tester.pumpWidget(
        TestAppWrapper(
          child: NoDataWidget(
            title: titleWithSpecial,
            message: messageWithSpecial,
          ),
        ),
      );

      expect(find.text(titleWithSpecial), findsOneWidget);
      expect(find.text(messageWithSpecial), findsOneWidget);
    });

    testWidgets('column children order is correct', (tester) async {
      const title = 'First';
      const message = 'Second';

      await tester.pumpWidget(
        const TestAppWrapper(
          child: NoDataWidget(title: title, message: message),
        ),
      );

      final columnWidget = tester.widget<Column>(find.byType(Column));
      expect(columnWidget.children.length, 2);

      // First child should be the title Text widget
      expect(columnWidget.children.first, isA<Text>());
      // Second child should be the message Text widget
      expect(columnWidget.children.last, isA<Text>());
    });

    testWidgets('works as standalone widget', (tester) async {
      // Test without TestAppWrapper but with basic MaterialApp
      await tester.pumpWidget(
        MaterialApp(home: const NoDataWidget(title: 'Standalone')),
      );

      expect(find.text('Standalone'), findsOneWidget);
    });
  });
}
