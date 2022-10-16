import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagRainbowBar ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagRainbowBar = TagRainbowBar();
      await tester.pumpWidget(
        wrapWithBaseApp(tagRainbowBar),
      );
      final Finder resultSearch = find.ancestor(
        of: find.byType(Flexible),
        matching: find.byType(Container),
      );

      expect(
        resultSearch,
        findsNWidgets(4),
      );
    });
    testWidgets("render color Blue", (WidgetTester tester) async {
      final tagRainbowBar = TagRainbowBar();
      await tester.pumpWidget(
        wrapWithBaseApp(tagRainbowBar),
      );
      final Finder resultSearch = find.descendant(
        of: find.byType(Flexible),
        matching: find.byType(Container),
      );

      final boxResult = tester.widget<Container>(
        resultSearch.at(0),
      );
      expect(
          boxResult.color,
          equals(
            const Color(0xFF667DF4),
          ));
    });
    testWidgets("render color Red", (WidgetTester tester) async {
      final tagRainbowBar = TagRainbowBar();
      await tester.pumpWidget(
        wrapWithBaseApp(tagRainbowBar),
      );
      final Finder resultSearch = find.descendant(
        of: find.byType(Flexible),
        matching: find.byType(Container),
      );

      final boxResult = tester.widget<Container>(
        resultSearch.at(1),
      );
      expect(
          boxResult.color,
          equals(
            const Color(0xFFF45A5A),
          ));
    });
    testWidgets("render color Green", (WidgetTester tester) async {
      final tagRainbowBar = TagRainbowBar();
      await tester.pumpWidget(
        wrapWithBaseApp(tagRainbowBar),
      );
      final Finder resultSearch = find.descendant(
        of: find.byType(Flexible),
        matching: find.byType(Container),
      );

      final boxResult = tester.widget<Container>(
        resultSearch.at(2),
      );
      expect(
          boxResult.color,
          equals(
            const Color(0xFF66D654),
          ));
    });
    testWidgets("render color Yellow", (WidgetTester tester) async {
      final tagRainbowBar = TagRainbowBar();
      await tester.pumpWidget(
        wrapWithBaseApp(tagRainbowBar),
      );
      final Finder resultSearch = find.descendant(
        of: find.byType(Flexible),
        matching: find.byType(Container),
      );

      final boxResult = tester.widget<Container>(
        resultSearch.at(3),
      );
      expect(
          boxResult.color,
          equals(
            const Color(0xFFEADA48),
          ));
    });
  });
}
