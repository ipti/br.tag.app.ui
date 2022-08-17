import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("TagDropdownField render", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
          onChanged: () {}, label: "Textinho", items: const {});
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(TagDropdownField);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("TagDropdownField render with hint",
        (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
        onChanged: () {},
        label: "Textinho",
        items: const {},
        hint: "Dica",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(Text);
      expect(resultSearch, findsWidgets);
      final Finder hintResult = find.text("Dica");
      expect(hintResult, findsWidgets);
      //verificar porque aparece mais de um hint
      //hint tem uma propriedad para encurtar caso fique muito grande
    });
    testWidgets("TagDropdownField render with padding",
        (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
        onChanged: () {},
        label: "Textinho",
        items: const {},
        padding: EdgeInsets.all(16.0),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(TagDropdownField);
      expect(resultSearch, findsWidgets);
      final paddingResult = tester.widget<TagDropdownField>(resultSearch);
      expect(paddingResult.padding, equals(EdgeInsets.all(16.0)));
    });
    // testWidgets("when text is invalid",(WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   final tagDropdownField = TagDropdownField(
    //     onChanged: () {},
    //     label: "Textinho",
    //     items: const {},
    //     controller: controller,
    //     validator: (value) =>
    //         (value?.isEmpty ?? true) ? "Por favor retorne um valor" : null,
    //   );
    //   await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
    //   final Finder resultSearch = find.byType(DropdownButtonFormField);
    //   //await tester.enterText(resultSearch, 'entrar com texto');
    //   await tester.pumpAndSettle();
    //   await tester.enterText(resultSearch, '');
    //   await tester.pumpAndSettle();
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pumpAndSettle();
    //   final Finder errorMessageSearch = find.text("Por favor retorne um valor");
    //   expect(errorMessageSearch, findsWidgets);
    // });
    testWidgets("TagDropdownField render with items",
        (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
        onChanged: () {},
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch4 = find.byType(Text);
      expect(resultSearch4, findsWidgets);
    });
  });
}
