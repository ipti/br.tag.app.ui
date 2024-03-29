import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/breadcrumb/tag_breadcrumb_item.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/hover_widget.dart';
import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagBreadcrumbItem", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagBreadcrumbItem = TagBreadcrumbItem(
        title: 'home',
      );
      await tester.pumpWidget(wrapWithBaseApp(tagBreadcrumbItem));
      final Finder resultSearch = find.byType(TagBreadcrumbItem);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("tap an Item", (WidgetTester tester) async {
      final dumb = MockDumb();
      final tagBreadcrumbItem = TagBreadcrumbItem(
        title: 'home',
        action: () {
          dumb.call();
        },
      );
      when(() => dumb.call()).thenAnswer((invocation) {});
      await tester.pumpWidget(wrapWithBaseApp(tagBreadcrumbItem));
      final Finder resultSearch = find.byType(TagBreadcrumbItem);

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      verify(() => dumb.call()).called(1);
    });
    testWidgets("style is formated", (WidgetTester tester) async {
      ///TODO: Revisar esse nome com igor
      final tagBreadcrumbItem = TagBreadcrumbItem(
        title: 'home',
      );
      await tester.pumpWidget(wrapWithBaseApp(tagBreadcrumbItem));
      final Finder resultSearch = find.byType(RichText);

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      final item = tester.widget<RichText>(resultSearch);

      expect( item.text.style?.fontWeight, equals(TagFontWeight.fontWeightLinks));
      expect(item.text.style?.fontSize, equals(TagFontSize.fontSizeTextNormal));
      expect(item.text.style?.color, equals(TagColors.colorBaseProductNormal));
    });
    testWidgets("render with hover", (WidgetTester tester) async {
      final tagBreadcrumbItem = TagBreadcrumbItem(
        title: 'home',
      );
      await tester.pumpWidget(wrapWithBaseApp(tagBreadcrumbItem));
      final Finder resultSearch = find.byType(TagBreadcrumbItem);

      await hoverAutoRemove(tester, resultSearch);

      final item = tester.widget<RichText>(find.byType(RichText));
      expect(item.text.style?.decoration, equals(TextDecoration.underline));
    });

    testWidgets("remove the undeline when pointer is not under the text", (WidgetTester tester) async {
      ///TODO: Revisar esse nome com igor
      final tagBreadcrumbItem = TagBreadcrumbItem(
        title: 'home',
      );
      await tester.pumpWidget(wrapWithBaseApp(tagBreadcrumbItem));
      final Finder resultSearch = find.byType(TagBreadcrumbItem);
      final gestureIn = await hoverIn(tester, resultSearch);
      await gestureIn.removePointer();
      await tester.pumpAndSettle();

      final item = tester.widget<RichText>(find.byType(RichText));
      expect(
          item.text.style?.decoration, isNot(equals(TextDecoration.underline)));
    });
  });
}
