import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

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
    testWidgets("render with custom key", (WidgetTester tester) async {
      final tagAppBar = MaterialApp(
        home: Scaffold(
          appBar: TagAppBar(
            key: Key("APP_BAR_KEY"),
            title: Text("titulo"),
          ),
        ),
      );

      await tester.pumpWidget(tagAppBar);
      final Finder resultSearchKey = find.byKey(Key("APP_BAR_KEY"));
      expect(resultSearchKey, findsOneWidget);
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
      final Finder resultSearchTitle = find.text("titulo");
      expect(resultSearchTitle, findsWidgets);
    });
    testWidgets("render with logo ", (WidgetTester tester) async {
      final tagAppBar = MaterialApp(
        home: Scaffold(
          appBar: TagAppBar(),
        ),
      );
      await tester.pumpWidget(wrapWithBaseAppAndBundle(tagAppBar));
      final Finder resultSearchLogo = find.byType(TagLogo);
      expect(resultSearchLogo, findsOneWidget);
    });
    testWidgets("buton menu is lead", (WidgetTester tester) async {
      ///TODO: Revisar esse nome com igor
      final tagAppBar = MaterialApp(
        home: Scaffold(
          drawer: Container(key: Key('drawer')),
          appBar: TagAppBar(
            leading: TagAppBarMenuIconButton(),
          ),
        ),
      );
      await tester.pumpWidget(tagAppBar);
      final Finder resultSearchIcon = find.byIcon(Icons.menu);
      await tester.tap(resultSearchIcon);
      await tester.pumpAndSettle();
      final Finder resultSearchDrawer = find.byKey(Key('drawer'));
      expect(resultSearchDrawer, findsOneWidget);
    });
    testWidgets("child is called", (WidgetTester tester) async {
      final tagAppBar = TagAppBar();
      final child = tagAppBar.child;
      expect(child, equals(tagAppBar));
    });

    testWidgets("buton back is leading", (WidgetTester tester) async {
      ///TODO: Revisar esse nome com igor
      final navigatorMock = MockNavigator();
      when(() => navigatorMock.pop()).thenAnswer((_) async {
        return null;
      });
      final tagAppBar = MaterialApp(
        home: MockNavigatorProvider(
          navigator: navigatorMock,
          child: Scaffold(
            appBar: TagAppBar(
              leading: TagAppBarBackIconButton(),
            ),
          ),
        ),
      );
      await tester.pumpWidget(tagAppBar);
      final Finder resultSearchIcon = find.byIcon(Icons.arrow_back);
      await tester.tap(resultSearchIcon);
      await tester.pumpAndSettle();

      expect(resultSearchIcon, findsOneWidget);
      verify(() => navigatorMock.pop()).called(1);
    });
  });
}
