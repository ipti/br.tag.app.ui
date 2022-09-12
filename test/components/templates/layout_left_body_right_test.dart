import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/templates/layout_left_body_right.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When LayoutLeftBodyRight", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render", (WidgetTester tester) async {
      final layoutLeftBodyRight = LayoutLeftBodyRight(
        body: Container(),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftBodyRight));
      final Finder resultSearch = find.byType(LayoutLeftBodyRight);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render body", (WidgetTester tester) async {
      final layoutLeftBodyRight = LayoutLeftBodyRight(
        body: Container(
          key: Key("Body"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftBodyRight));
      final Finder resultSearchKey = find.byKey(Key("Body"));
      expect(resultSearchKey, findsOneWidget);
    });
    testWidgets("render right", (WidgetTester tester) async {
      final layoutLeftBodyRight = LayoutLeftBodyRight(
        body: Container(
          key: Key("Body"),
        ),
        right: Container(
          key: Key("Right"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftBodyRight));
      final Finder resultSearchKey = find.byKey(Key("Right"));
      expect(resultSearchKey, findsOneWidget);
    });
    testWidgets("render left", (WidgetTester tester) async {
      final layoutLeftBodyRight = LayoutLeftBodyRight(
        body: Container(
          key: Key("Body"),
        ),
        left: Container(
          key: Key("Left"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftBodyRight));
      final Finder resultSearchKey = find.byKey(Key("Left"));
      expect(resultSearchKey, findsOneWidget);
    });
    testWidgets("render left and right", (WidgetTester tester) async {
      final layoutLeftBodyRight = LayoutLeftBodyRight(
        body: Container(
          key: Key("Body"),
        ),
        left: Container(
          key: Key("Left"),
        ),
        right: Container(
          key: Key("Right"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftBodyRight));
      final Finder resultSearchLeft = find.byKey(Key("Left"));
      expect(resultSearchLeft, findsOneWidget);
      final Finder resultSearchRight = find.byKey(Key("Right"));
      expect(resultSearchRight, findsOneWidget);
    });
  });
}
