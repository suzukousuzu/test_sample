import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver(responseDataCallback: (data) async {
      if (data != null) {
        final timeLine = driver.Timeline.fromJson(data['scrolling_timeline']);
        final summary = driver.TimelineSummary.summarize(timeLine);

        await summary.writeTimelineToFile(
          'scrolling_timeline',
          includeSummary: true,
        );
      }
    });
