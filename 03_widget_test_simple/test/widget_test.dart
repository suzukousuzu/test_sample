// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_simple/home_screen.dart';

void main() {
  group('homeScreen', () {
    testWidgets('has a title and message', (widgetTester) async {
      await widgetTester.pumpWidget(
        // Arrange
        const MaterialApp(home: HomeScreen(title: 't', message: 'm')),
      );

      // Action
      final titleFinder = find.text('t');
      final messageFinder = find.text('m');

      // Assert
      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets('has a specific key', (widgetTester) async {
      const testKey = Key('key');
      await widgetTester.pumpWidget(
        const MaterialApp(
          key: testKey,
          home: HomeScreen(title: 'title', message: 'message'),
        ),
      );
      final keyFinder = find.byKey(testKey);

      expect(keyFinder, findsOneWidget);
    });
  });

  testWidgets('find a specific instance', (widgetTester) async {
    const childWidget = Padding(
      padding: EdgeInsets.only(top: 6),
    );
    await widgetTester.pumpWidget(
      Container(
        child: childWidget,
      ),
    );
    final childFinder = find.byWidget(childWidget);

    expect(childFinder, findsOneWidget);
  });
}
