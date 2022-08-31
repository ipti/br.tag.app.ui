import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/templates/layout_left_and_body.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When LayoutLeftAndBody", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render", (WidgetTester tester) async {
      final layoutLeftAndBody = LayoutLeftAndBody(
        body: Container(
          key: Key("Body"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftAndBody));
      final Finder resultSearchKey = find.byKey(Key("Body"));
      expect(resultSearchKey, findsOneWidget);
    });
    testWidgets("render with Left", (WidgetTester tester) async {
      final layoutLeftAndBody = LayoutLeftAndBody(
        body: Container(
          key: Key("Body"),
        ),
        left: Container(
          key: Key("Left"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutLeftAndBody));
      final Finder resultSearchKey = find.byKey(Key("Left"));
      expect(resultSearchKey, findsOneWidget);
    });
  });
}
