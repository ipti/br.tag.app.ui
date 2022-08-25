import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/methods/rich_text_to_plain.dart';
import '../../helpers/methods/scaffold_widget.dart';

void main() {
  group("When LayoutLeftBodyRight", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render with titulo", (WidgetTester tester) async {
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: [],
        description: "descrição",
        body: Container(
          key: Key("Body"),
        ),
        menu: Container(
          key: Key("menu"),
        ),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.text("titulo");
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with render path's correct first item",
        (WidgetTester tester) async {
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: Container(
          key: Key("Body"),
        ),
        menu: Container(
          key: Key("menu"),
        ),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.byWidgetPredicate(
          (widget) => fromRichTextToPlainText(widget) == "menu");

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with render path's correct last item",
        (WidgetTester tester) async {
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: Container(
          key: Key("Body"),
        ),
        menu: Container(
          key: Key("menu"),
        ),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.byWidgetPredicate(
          (widget) => fromRichTextToPlainText(widget) == "mangás");

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with body", (WidgetTester tester) async {
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: Container(
          key: Key("Body"),
        ),
        menu: Container(
          key: Key("menu"),
        ),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.byKey(Key("Body"));
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with menu", (WidgetTester tester) async {
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: Container(
          key: Key("Body"),
        ),
        menu: Container(
          key: Key("menu"),
        ),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.byKey(Key("menu"));
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with actionsHeader", (WidgetTester tester) async {
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: Container(
          key: Key("Body"),
        ),
        menu: Container(
          key: Key("menu"),
        ),
        actionsHeader: DumbHeader(),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.byKey(Key("actionsHeader"));
      expect(resultSearch, findsOneWidget);
    });
  });
}
