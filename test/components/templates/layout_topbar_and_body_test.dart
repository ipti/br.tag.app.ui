import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/templates/layout_topbar_and_body.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When layoutTopBarAndBody", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render ", (WidgetTester tester) async {
      final layoutTopBarAndBody = LayoutTopBarAndBody(
        body: Container(
          key: Key("Body"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutTopBarAndBody));
      final Finder resultSearch = find.byKey(Key("Body"));
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with drawer", (WidgetTester tester) async {
      final layoutTopBarAndBody = LayoutTopBarAndBody(
        body: Container(),
        drawer: Drawer(
          key: Key("Drawer"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(layoutTopBarAndBody));
      final Finder resultSearch = find.byIcon(Icons.menu);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      final Finder resultDrawer = find.byKey(Key("Drawer"));
      expect(resultDrawer, findsOneWidget);
    });
    testWidgets("render with appBar", (WidgetTester tester) async {
      final layoutTopBarAndBody = LayoutTopBarAndBody(
          body: Container(),
          appBar: TagAppBar(
            key: Key("appBar"),
          ));
      await tester.pumpWidget(wrapWithBaseApp(layoutTopBarAndBody));
      final Finder resultSearch = find.byKey(Key("appBar"));
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with drawer and appbar", (WidgetTester tester) async {
      final layoutTopBarAndBody = LayoutTopBarAndBody(
          body: Container(),
          drawer: Drawer(
            key: Key("Drawer"),
          ),
          appBar: TagAppBar(
            key: Key("appBar"),
          ));
      await tester.pumpWidget(wrapWithBaseApp(layoutTopBarAndBody));
      final Finder resultSearch = find.byIcon(Icons.menu);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      final Finder resultDrawer = find.byKey(Key("Drawer"));
      expect(resultDrawer, findsOneWidget);
      await tester.pumpWidget(wrapWithBaseApp(layoutTopBarAndBody));
      final Finder resultAppBar = find.byKey(Key("appBar"));
      expect(resultAppBar, findsOneWidget);
    });
  });
}
