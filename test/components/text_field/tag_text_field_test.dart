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
    testWidgets("render", (WidgetTester tester) async {
      final tagTextField = TagTextField(label: "TextinhoLabel");
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final Finder resultSearchLabel = find.text("TextinhoLabel");
      expect(resultSearchLabel, findsOneWidget);
    });
    testWidgets("render whit hint", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        hint: "TextinhoHint",
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final Finder resultSearchHint = find.text("TextinhoHint");
      expect(resultSearchHint, findsOneWidget);
    });
    testWidgets("render whit inputType", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        inputType: TextInputType.text,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField resultSearchInput =
          tester.widget<TextField>(resultSearch);
      expect(
        resultSearchInput.keyboardType,
        equals(TextInputType.text),
      );
    });
    testWidgets("render whit obscureText", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        obscureText: true,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField resultSearchObscure =
          tester.widget<TextField>(resultSearch);
      expect(
        resultSearchObscure.obscureText,
        equals(true),
      );
    });
    testWidgets("render whit value", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        value: "TextinhoValor",
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final Finder resultSearchValor = find.text("TextinhoValor");
      expect(resultSearchValor, findsOneWidget);
    });
    testWidgets("render with maxLines and minLines",
        (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        minLines: 1,
        maxLines: 1,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField resultSearcLines = tester.widget<TextField>(resultSearch);

      expect(
        resultSearcLines.maxLines,
        equals(1),
      );
      expect(
        resultSearcLines.minLines,
        equals(1),
      );
    });
    testWidgets("render with padding", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        padding: EdgeInsets.all(16.0),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TagTextField);
      final TagTextField resultSearchInput =
          tester.widget<TagTextField>(resultSearch);
      expect(
          resultSearchInput.padding,
          equals(
            EdgeInsets.all(16.0),
          ));
    });
    testWidgets("render with controller change value",
        (WidgetTester tester) async {
      final controller = TextEditingController(text: "");

      final tagTextField = TagTextField(
        label: "Label",
        controller: controller,
        onChanged: (value) {},
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, 'TextinhoControler');
      await tester.pump();
      expect(
        controller.text,
        equals('TextinhoControler'),
      );
    });
    testWidgets("render when values change", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, 'TextinhoOnChange');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1('TextinhoOnChange'),
      ).called(1);
    });
    testWidgets("render when text is edited", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(
        () => dumb.call(),
      ).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        onEditingComplete: () => dumb.call(),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TagTextField);

      await tester.enterText(resultSearch, 'TextinhoonEditingComplete');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      verify(
        () => dumb.call(),
      ).called(2);
    });
    testWidgets("render when text is invalid", (WidgetTester tester) async {
      final controller = TextEditingController();

      final tagTextField = TagTextField(
        label: "Label",
        controller: controller,
        value: "",
        validator: (value) =>
            (value?.isEmpty ?? true) ? "Por favor retorne um valor" : null,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, 'Teste com texto');
      await tester.pumpAndSettle();
      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final Finder resultSearchErrorMessage =
          find.text("Por favor retorne um valor");

      expect(resultSearchErrorMessage, findsOneWidget);
    });
    testWidgets("render with maxLength", (WidgetTester tester) async {
      final tagTextField = TagTextField(
        label: "Label",
        maxLength: 10,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );
      final Finder resultSearch = find.byType(TextField);
      expect(resultSearch, findsOneWidget);
      final TextField resultSearchMaxLength =
          tester.widget<TextField>(resultSearch);

      expect(
        resultSearchMaxLength.maxLength,
        equals(10),
      );
    });

    group(
      "render with formatter",
      (() {
        testWidgets("with formatters digit number",
            (WidgetTester tester) async {
          final controller = TextEditingController();
          final tagTextField = TagTextField(
              label: "Label",
              controller: controller,
              formatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]);
          await tester.pumpWidget(
            wrapWithBaseApp(tagTextField),
          );
          final Finder resultSearch = find.byType(TextField);
          await tester.enterText(resultSearch, '12');
          await tester.pumpAndSettle();
          expect(find.text('12'), findsOneWidget);
        });
        testWidgets("render with formatters digit ",
            (WidgetTester tester) async {
          final controller = TextEditingController();
          final tagTextField = TagTextField(
              label: "Label",
              controller: controller,
              formatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ]);
          await tester.pumpWidget(
            wrapWithBaseApp(tagTextField),
          );
          final Finder resultSearch = find.byType(TextField);
          await tester.enterText(resultSearch, 'aa');
          await tester.pumpAndSettle();
          expect(find.text(''), findsOneWidget);
        });
      }),
    );
  });
}
