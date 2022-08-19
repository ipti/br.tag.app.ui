import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/text_field/tag_text_field.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagTextField", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("Render", (WidgetTester tester) async {
      final tagTextField = TagTextField(label: "TextinhoLabel");
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final Finder labelResult = find.text("TextinhoLabel");
      expect(labelResult, findsOneWidget);
    });
    testWidgets("Render whit hint", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        hint: "TextinhoHint",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final Finder hintResult = find.text("TextinhoHint");
      expect(hintResult, findsOneWidget);
    });
    testWidgets("Render whit inputType", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        inputType: TextInputType.text,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField inputResult = tester.widget<TextField>(resultSearch);
      expect(inputResult.keyboardType, equals(TextInputType.text));
    });
    testWidgets("Render whit obscureText", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        obscureText: true,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField obscureResult = tester.widget<TextField>(resultSearch);
      expect(obscureResult.obscureText, equals(true));
    });
    testWidgets("Render whit value", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        value: "TextinhoValor",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final Finder valorResult = find.text("TextinhoValor");
      expect(valorResult, findsOneWidget);
    });
    testWidgets("with maxLines and minLines", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        minLines: 1,
        maxLines: 1,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField maxMinResult = tester.widget<TextField>(resultSearch);

      expect(maxMinResult.maxLines, equals(1));
      expect(maxMinResult.minLines, equals(1));
    });
    testWidgets("Render with padding", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        padding: EdgeInsets.all(16.0),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField input = tester.widget<TagTextField>(resultSearch);
      expect(input.padding, equals(EdgeInsets.all(16.0)));
    });
    testWidgets("with controller change value", (WidgetTester tester) async {
      final controller = TextEditingController(text: "");

      final tagTextField = TagTextField(
        label: "Label",
        controller: controller,
        onChanged: (value) {},
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, 'TextinhoControler');
      await tester.pump();
      expect(controller.text, equals('TextinhoControler'));
     
    });
    testWidgets("when values change", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, 'TextinhoOnChange');
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1('TextinhoOnChange')).called(1);
    });
    testWidgets("when text is edited", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.call()).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        onEditingComplete: () => dumb.call(),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TagTextField);

      await tester.enterText(resultSearch, 'TextinhoonEditingComplete');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(() => dumb.call()).called(2);
    });
    testWidgets("when text is invalid", (WidgetTester tester) async {
      final controller = TextEditingController();

      final tagTextField = TagTextField(
        label: "Label",
        controller: controller,
        value: "",
        validator: (value) =>
            (value?.isEmpty ?? true) ? "Por favor retorne um valor" : null,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, 'Teste com texto');
      await tester.pumpAndSettle();
      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final Finder errorMessageSearch = find.text("Por favor retorne um valor");

      expect(errorMessageSearch, findsOneWidget);
    });
    testWidgets("with maxLength", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        maxLength: 10,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagTextField));
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField maxLengthResult = tester.widget<TextField>(resultSearch);

      expect(maxLengthResult.maxLength, equals(10));
    });

    group("with formatter", (() {
      testWidgets("with formatters digit number", (WidgetTester tester) async {
        final controller = TextEditingController();
        final tagTextField = TagTextField(
            label: "Label",
            controller: controller,
            formatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ]);
        await tester.pumpWidget(wrapWithBaseApp(tagTextField));
        final Finder resultSearch = find.byType(TextField);
        await tester.enterText(resultSearch, '12');
        await tester.pumpAndSettle();
        expect(find.text('12'), findsOneWidget);
      });
      testWidgets("with formatters digit ", (WidgetTester tester) async {
        final controller = TextEditingController();
        final tagTextField = TagTextField(
            label: "Label",
            controller: controller,
            formatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ]);
        await tester.pumpWidget(wrapWithBaseApp(tagTextField));
        final Finder resultSearch = find.byType(TextField);
        await tester.enterText(resultSearch, 'aa');
        await tester.pumpAndSettle();
        expect(find.text(''), findsOneWidget);
      });
    }));

    // The WhitelistingTextInputFormatter.digitsOnly is deprecated. use FilteringTextInputFormatter.digitsOnly
  });
}
