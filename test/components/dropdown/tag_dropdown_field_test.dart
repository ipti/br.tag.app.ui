import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagDropdownField ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField<dynamic>(
          onChanged: (value) {}, label: "Textinho", items: const {});
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(TagDropdownField);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with hint", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField<dynamic>(
        onChanged: (value) {},
        label: "Textinho",
        items: const {},
        hint: "Dica",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearchHint = find.text("Dica");
      expect(resultSearchHint, findsOneWidget);
    });
    testWidgets("render with padding", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField<dynamic>(
        onChanged: (value) {},
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
    testWidgets("render with items", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
        onChanged: (value) {},
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(Text);
      expect(resultSearch, findsWidgets);
    });
    testWidgets("render with label", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
        onChanged: (value) {},
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(TagLabel);
      expect(resultSearch, findsOneWidget);
      final Finder resultSearchLabel = find.text("Textinho");
      expect(resultSearchLabel, findsOneWidget);
    });
    testWidgets("render with label", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField(
        onChanged: (value) {},
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(TagLabel);
      expect(resultSearch, findsOneWidget);
      final Finder resultSearchLabel = find.text("Textinho");
      expect(resultSearchLabel, findsOneWidget);
    });
    testWidgets("render whit value", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField<String>(
        onChanged: (value) {},
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
        value: "chave1",
      );
      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(Text);
      expect(resultSearch, findsWidgets);
      final Finder resultSearchValue = find.text("valor1");
      expect(resultSearchValue, findsOneWidget);
    });
    testWidgets("when value is changed", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});

      final tagDropdownField = TagDropdownField<String>(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
      );

      final Type dropdownButtonType = DropdownButtonFormField<String>(
        onChanged: (value) {},
        items: const [],
      ).runtimeType;

      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(dropdownButtonType);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      await tester.tap(find.text('valor1').last);
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1("chave1")).called(1);
    });

    testWidgets("when text is invalid", (WidgetTester tester) async {
      final tagDropdownField = TagDropdownField<String>(
        onChanged: (value) {},
        label: "Textinho",
        items: const {
          'chave1': 'valor1',
          'chave2': 'valor2',
          'chave3': 'valor3'
        },
        autovalidateMode: AutovalidateMode.always,
        validator: (value) {
          return value == "chave1" ? "Por favor retorne um valor" : null;
        },
      );

      final Type dropdownButtonType = DropdownButtonFormField<String>(
        onChanged: (value) {},
        items: const [],
      ).runtimeType;

      await tester.pumpWidget(wrapWithBaseApp(tagDropdownField));
      final Finder resultSearch = find.byType(dropdownButtonType);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      await tester.tap(find.text('valor1').last);
      await tester.pumpAndSettle();

      final Finder errorMessageSearch = find.text("Por favor retorne um valor");
      expect(errorMessageSearch, findsOneWidget);
    });
  });
}
