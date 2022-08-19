import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
          
void main() {
  group("When TagAppBar", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagAppBar = MaterialApp(
        home: Scaffold(
          appBar: TagAppBar(
            title: Text("titulo"),
          ),
        ),
      );

      await tester.pumpWidget(tagAppBar);
      final Finder resultSearch = find.byType(AppBar);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with text ", (WidgetTester tester) async {
      final tagAppBar = MaterialApp(
        home: Scaffold(
          appBar: TagAppBar(
            title: Text("titulo"),
          ),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagAppBar));
      final Finder resultSearch = find.text("titulo");
      expect(resultSearch, findsWidgets);
    });
    testWidgets("render with logo ", (WidgetTester tester) async {
      final tagAppBar = MaterialApp(
        home: Scaffold(
          appBar: TagAppBar(),
        ),
      );
      await tester.pumpWidget(wrapWithBaseAppAndBundle(tagAppBar));
      final Finder resultSearch = find.byType(TagLogo);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("tap iconButton", (WidgetTester tester) async {
      final tagAppBar = MaterialApp(
        home: Scaffold(
          drawer: Container(key: Key('drawer')),
          appBar: TagAppBar(),
        ),
      );
      await tester.pumpWidget(tagAppBar);
      final Finder resultSearch = find.byType(IconButton);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      final Finder drawerSearch = find.byKey(Key('drawer'));
      expect(drawerSearch, findsOneWidget);
    });
    testWidgets("child is called", (WidgetTester tester) async {
      final tagAppBar = TagAppBar();
      final child = tagAppBar.child;
      expect(child, equals(tagAppBar));
    });
  });
}
