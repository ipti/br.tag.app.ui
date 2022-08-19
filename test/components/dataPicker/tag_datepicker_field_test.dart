import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagBreadcrumbItem", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder resultSearch = find.byType(TagDatePickerField);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with label", (WidgetTester tester) async {
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder resultSearch = find.byType(TagDatePickerField);
      expect(resultSearch, findsOneWidget);
      final Finder labelResult = find.text("Textinho");
      expect(labelResult, findsOneWidget);
    });
    testWidgets("render with hint", (WidgetTester tester) async {
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
        hint: "textinhoHint",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder hintResult = find.text("textinhoHint");
      expect(hintResult, findsOneWidget);
    });

    
    
    testWidgets("render with inputType", (WidgetTester tester) async {
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
        inputType: TextInputType.text,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder resultSearch = find.byType(TagDatePickerField);
      expect(resultSearch, findsOneWidget);
      final inputTypeResult = tester.widget<TagDatePickerField>(resultSearch);
      expect(inputTypeResult.inputType, equals(TextInputType.text));
    });
    testWidgets("render with inputType", (WidgetTester tester) async {
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
        inputType: TextInputType.text,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder resultSearch = find.byType(TagDatePickerField);
      expect(resultSearch, findsOneWidget);
      final inputTypeResult = tester.widget<TagDatePickerField>(resultSearch);
      expect(inputTypeResult.inputType, equals(TextInputType.text));
    });

// ===========
    testWidgets("with controller change value", (WidgetTester tester) async {
      final controller = TextEditingController(text: "");

      final tagTextField = TagDatePickerField(
        label: "Label",
        controller: controller,
        onChanged: (value) {},
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, '19041995');
      await tester.pump();
      expect(controller.text, equals('19/04/1995'));
    });
    testWidgets("render with controller change value",
        (WidgetTester tester) async {
      final controller = TextEditingController();
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
        controller: controller,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder resultSearch = find.byType(TagDatePickerField);
      await tester.enterText(resultSearch, '27121973');
      await tester.pump();
      expect(controller.text, equals('27/12/1973'));
    });
    testWidgets("when values change", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagTextField = TagDatePickerField(
        label: "Label",
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '19041995');
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1('19/04/1995')).called(1);
    });
    testWidgets("render with value", (WidgetTester tester) async {
      final tagDatePickerField = TagDatePickerField(
        label: "Textinho",
        onChanged: (value) {},
        value: "27121973",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDatePickerField));
      final Finder resultSearch = find.byType(TagDatePickerField);
      expect(resultSearch, findsOneWidget);
      final Finder valueResult = find.text("27121973");
      expect(valueResult, findsOneWidget);
    });
    testWidgets("when text is edited", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.call()).thenAnswer((invocation) {});
      final tagTextField = TagDatePickerField(
        label: "Label",
        onChanged: (_) {},
        onEditingComplete: () => dumb.call(),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagDatePickerField);

      await tester.enterText(resultSearch, '19041995');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(() => dumb.call()).called(1);
    });
    testWidgets("when text is invalid", (WidgetTester tester) async {
      final tagTextField = TagDatePickerField(
        label: "Label",
        value: "",
        onChanged: (_) {},
        validator: (value) =>
            (value?.isEmpty ?? true) ? "Por favor retorne um valor" : null,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, '19041995');
      await tester.pumpAndSettle();
      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final Finder errorMessageSearch = find.text("Por favor retorne um valor");

      expect(errorMessageSearch, findsOneWidget);
    });
  });
}
