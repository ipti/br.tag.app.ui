import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagBox ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagBox = TagBox(
        child: Text("Texto"),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagBox),
      );
      final Finder resultSearch = find.text("Texto");
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with custom values for minHeight and minWidth",
        (WidgetTester tester) async {
      final tagBox = TagBox(
        child: Text("Texto"),
        minHeight: 0,
        minWidth: 0,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagBox),
      );
      final Finder resultSearch = find.byType(Container);
      final Container resultBox = tester.widget<Container>(resultSearch);

      expect(
        resultBox.constraints!.minHeight,
        equals(0),
      );
      expect(
        resultBox.constraints!.minWidth,
        equals(0),
      );
    });
    testWidgets("render with background and padding",
        (WidgetTester tester) async {
      final tagBox = TagBox(
        child: Text("Texto"),
        background: Color(0xAA),
        padding: EdgeInsets.all(16.0),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagBox),
      );

      final Finder resultSearch = find.byType(Container);
      final Container resultBox = tester.widget<Container>(resultSearch);

      expect(
          (resultBox.decoration as BoxDecoration).color,
          equals(
            Color(0xAA),
          ));
      expect(
          resultBox.padding,
          equals(
            EdgeInsets.all(16.0),
          ));
    });
  });
}
