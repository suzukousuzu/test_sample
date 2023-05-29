// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:handle_scrolling/home_screen.dart';

void main() {
  group('homeScreen', () {
    testWidgets('scroll and find item by scrolling key', (widgetTester) async {
      // arrange
      await widgetTester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            items: List.generate(10000, (i) => "Item $i"),
          ),
        ),
      );

      // action
      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(
        const ValueKey('item_100_text'),
      );

      await widgetTester.scrollUntilVisible(
        itemFinder,
        500,
        scrollable: listFinder,
      );

      // assert
      expect(itemFinder, findsOneWidget);
    });
  });
}
