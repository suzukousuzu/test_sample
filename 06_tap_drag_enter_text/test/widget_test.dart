// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap_drag_enter_text/home_screen.dart';

void main() {
  group('homeSceeen', () {
    testWidgets('add and remove todo', (widgetTester) async {
      // arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );

      // act(add)
      final textFieldFinder = find.byType(TextField);
      final floatingActionButtonFinder = find.byType(FloatingActionButton);
      await widgetTester.enterText(textFieldFinder, 'お買い物');
      await widgetTester.tap(floatingActionButtonFinder);

      //setStateの同じ役割
      await widgetTester.pump();

      // assert
      expect(find.text('お買い物'), findsOneWidget);

      // act(remove)
      final dismissibleFinder = find.byType(Dismissible);
      await widgetTester.drag(dismissibleFinder, const Offset(-500, 0));
      await widgetTester.pumpAndSettle();

      //assert(remove)
      expect(find.text('お買い物'), findsNothing);
    });
  });
}
