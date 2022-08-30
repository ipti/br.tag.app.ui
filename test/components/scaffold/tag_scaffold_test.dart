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
    testWidgets("render with aside", (WidgetTester tester) async {
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
        aside: Container(
          key: Key("aside"),
        ),
      );

      await tester.pumpWidget(wrapWithBaseApp(tagScaffold));
      final Finder resultSearch = find.byKey(Key("aside"));
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with tabBar", (WidgetTester tester) async {
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
        tabBar: TabBar(tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          ),
          Tab(
            icon: Icon(Icons.abc),
          )
        ]),
      );

      await tester.pumpWidget(wrapWithBaseApp(DefaultTabController(
        child: tagScaffold,
        length: 2,
      )));
      final Finder resultSearchTab = find.byType(Tab);
      expect(resultSearchTab, findsWidgets);
      final Finder resultSearchTabMenu = find.byIcon(Icons.menu);
      await tester.tap(resultSearchTabMenu);
      expect(resultSearchTabMenu, findsOneWidget);
      final Finder resultSearchTabAbc = find.byIcon(Icons.abc);
      await tester.tap(resultSearchTabAbc);
      expect(resultSearchTabAbc, findsOneWidget);
    });
    testWidgets("render scroll in mobile", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(360, 900));
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: TabBarView(children: [
          Container(
            color: Colors.red,
            key: const Key("Body"),
            child: const Text("data"),
          ),
          Container(
            color: Colors.blue,
            key: const Key("Body1"),
          ),
        ]),
        menu: Container(
          key: Key("menu"),
        ),
        actionsHeader: DumbHeader(),
        tabBar: TabBar(tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          ),
          Tab(
            icon: Icon(Icons.abc),
          )
        ]),
      );

      await tester.pumpWidget(wrapWithBaseApp(DefaultTabController(
        child: tagScaffold,
        length: 2,
      )));
      final Finder resultSearchTab = find.byType(Tab);
      expect(resultSearchTab, findsWidgets);
      final Finder resultSearchTabMenu = find.text("data");
      final positionInitial = tester.getCenter(resultSearchTabMenu);

      expect(resultSearchTabMenu, findsOneWidget);
      await tester.drag(resultSearchTabMenu, const Offset(0, -100));
      await tester.pumpAndSettle();

      final positionFinal = tester.getCenter(find.text("data"));

      expect(positionInitial.dy, greaterThan(positionFinal.dy));
    });
    testWidgets("render no scroll in desktop", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(1440, 900));
      final tagScaffold = TagScaffold(
        title: "titulo",
        path: ["menu", "mangás"],
        description: "descrição",
        body: TabBarView(children: [
          Container(
            color: Colors.red,
            key: const Key("Body"),
            child: const Text("data"),
          ),
          Container(
            color: Colors.blue,
            key: const Key("Body1"),
          ),
        ]),
        menu: Container(
          key: Key("menu"),
        ),
        actionsHeader: DumbHeader(),
        tabBar: TabBar(tabs: const <Widget>[
          Tab(
            icon: Icon(Icons.menu),
          ),
          Tab(
            icon: Icon(Icons.abc),
          )
        ]),
      );

      await tester.pumpWidget(wrapWithBaseApp(DefaultTabController(
        child: tagScaffold,
        length: 2,
      )));
      final Finder resultSearchTab = find.byType(Tab);
      expect(resultSearchTab, findsWidgets);
      final Finder resultSearchTabMenu = find.text("data");
      final positionInitial = tester.getCenter(resultSearchTabMenu);

      expect(resultSearchTabMenu, findsOneWidget);

      await tester.drag(resultSearchTabMenu, const Offset(0, -100));
      await tester.pumpAndSettle();

      final positionFinal = tester.getCenter(find.text("data"));

      expect(positionInitial.dy, equals(positionFinal.dy));
    });
  });
}
