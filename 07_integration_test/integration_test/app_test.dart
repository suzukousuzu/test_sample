import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_sample/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E', () {
    testWidgets('ap on the floating action button, verify counter',
        (widgetTester) async {
      // arrange
      app.main();
      await widgetTester.pumpAndSettle();

      // 1)初期値
      // act
      final textFinder = find.text('0');
      // assert
      expect(textFinder, findsOneWidget);

      // 2) ボタンを一回タップした時
      final floatingActionButtonFinder = find.byType(FloatingActionButton);
      await widgetTester.tap(floatingActionButtonFinder);
      await widgetTester.pumpAndSettle();
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
