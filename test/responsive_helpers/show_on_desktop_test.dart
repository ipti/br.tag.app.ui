import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../helpers/methods/prepare_widget.dart';

void main() {
  group("When ShowOnDesktop ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render", (WidgetTester tester) async {
      final showOnDesktop = ShowOnDesktop(
        child: Container(
          key: Key("Desktop"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(showOnDesktop));

      final Finder resultSearch = find.byType(ShowOnDesktop);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render on desktop", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(1440, 900));
      final showOnDesktop = ShowOnDesktop(
        child: Container(
          key: Key("Desktop"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(showOnDesktop));

      final Finder sizeResult = find.byKey(Key("Desktop"));
      expect(sizeResult, findsOneWidget);
    });
  });
}
