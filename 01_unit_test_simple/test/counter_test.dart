import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_simple/counter.dart';

/// 3A -Arrange,Act,Assert
void main() {
  // setup
  late Counter counter;
  setUp(() {
    counter = Counter();
  });
  group('counter', () {
    test('value should start at 0', () {
      // action
      final initialValue = counter.value;

      //assert
      expect(initialValue, 0);
    });
    test('Counter should be increment', () {
      // action
      counter.countUp();

      //assert
      expect(counter.value, 1);
    });

    test('Counter should be decrement', () {
      // action
      counter.countDown();

      //assert
      expect(counter.value, -1);
    });
  });
}
