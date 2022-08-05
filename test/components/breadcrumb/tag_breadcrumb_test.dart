// import 'package:flutter_test/flutter_test.dart';
// import 'package:tag_ui/src/components/breadcrumb/tag_breadcrumb_item.dart';
// import 'package:tag_ui/tag_ui.dart';

// import '../../helpers/methods/prepare_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/breadcrumb/tag_breadcrumb_item.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/methods/rich_text_to_plain.dart';

void main() {
  group("When ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("TagBreadcrumb render", (WidgetTester tester) async {
      final tagBreadcrumb = TagBreadcrumb(
        paths: [],
      );
      await tester.pumpWidget(wrapMaterial(tagBreadcrumb));
      final Finder resultSearch = find.byType(TagBreadcrumb);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("TagBreadcrumb render all items", (WidgetTester tester) async {
      final tagBreadcrumb = TagBreadcrumb(
        paths: ["menu", "mangás", "Aventura"],
      );
      await tester.pumpWidget(wrapMaterial(tagBreadcrumb));

      final Finder resultSearch = find.byType(TagBreadcrumbItem);

      expect(resultSearch, findsNWidgets(3));
    });

        testWidgets("TagBreadcrumb render the correct first item",
        (WidgetTester tester) async {
      final tagBreadcrumb = TagBreadcrumb(
        paths: ["Menu", "Mangás", "Aventura"],
      );

      await tester.pumpWidget(wrapMaterial(tagBreadcrumb));

      final Finder resultSearch = find.byWidgetPredicate(
          (widget) => fromRichTextToPlainText(widget) == "Menu");

      expect(resultSearch, findsOneWidget);
    });

    testWidgets("TagBreadcrumb render the correct last item",
        (WidgetTester tester) async {
      final tagBreadcrumb = TagBreadcrumb(
        paths: ["Menu", "Mangás", "Aventura"],
      );

      await tester.pumpWidget(wrapMaterial(tagBreadcrumb));

      final Finder resultSearch = find.byWidgetPredicate(
          (widget) => fromRichTextToPlainText(widget) == "Aventura");

      expect(resultSearch, findsOneWidget);
    });
  });
}
