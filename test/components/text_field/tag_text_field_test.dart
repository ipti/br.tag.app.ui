import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/text_field/tag_text_field.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagTextField", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("Render", (WidgetTester tester) async {
      final tagTextField = TagTextField(label: "Label");
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("Render whit hint", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        hint: "Textinho",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.hint, equals("Textinho"));
    });
    testWidgets("Render whit inputType", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        inputType: TextInputType.text,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.inputType, equals(TextInputType.text));
    });
    testWidgets("Render whit obscureText", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        obscureText: true,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.obscureText, equals(true));
    });
    testWidgets("Render whit obscureText", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        maxLength: 10,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.maxLength, equals(10));
    });
    testWidgets("Render whit value", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        value: "Valor",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.value, equals("Valor"));
    });
    testWidgets("Render whit maxLength and minLines",
        (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        maxLength: 1,
        minLines: 1,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.minLines, equals(1));
      expect(input.maxLength, equals(1));
    });
    testWidgets("Render whit padding", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        padding: EdgeInsets.all(16.0),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.padding, equals(EdgeInsets.all(16.0)));
    });
  });
}
