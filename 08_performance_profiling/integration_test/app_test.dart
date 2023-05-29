import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:performance_profiling/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('performance', () {
    testWidgets('scroll performance', (widgetTester) async {
      // arrange
      app.main();
      await widgetTester.pumpAndSettle();

      // action
      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(
        const ValueKey('item_100_text'),
      );

      await binding.traceAction(() async {
        await widgetTester.scrollUntilVisible(
          itemFinder,
          500,
          scrollable: listFinder,
        );
      }, reportKey: 'scrolling_timeline');

      // assert
      expect(itemFinder, findsOneWidget);
    });
  });
}
