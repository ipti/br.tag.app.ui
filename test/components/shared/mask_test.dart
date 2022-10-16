import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagMask maskTime", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render ", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskTime],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '1900');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1('19:00'),
      ).called(1);
    });
    testWidgets("render time is invalid", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskTime],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '8888');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1(''),
      ).called(1);
    });
    testWidgets("render is void", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskTime],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();

      verifyNever(
        () => dumb.callWithParam1(''),
      );
    });
    testWidgets("render with letters", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskTime],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, 'nnnn');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1(''),
      ).called(1);
    });
  });
  group("When TagMask maskCPF", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render ", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCPF],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '11122233344');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1('111.222.333-44'),
      ).called(1);
    });
    testWidgets("render cpf is invalid", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCPF],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '1112223334411111');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1('111.222.333-44'),
      ).called(1);
    });
    testWidgets("render with letters", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCPF],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, 'bbbbbbbbbbb');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1(''),
      ).called(1);
    });
    testWidgets("render with void", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCPF],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();

      verifyNever(
        () => dumb.callWithParam1(''),
      );
    });
  });

  group("When TagMask maskCEP", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render ", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCEP],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '00000000');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1('00000-000'),
      ).called(1);
    });
    testWidgets("render cep is invalid", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCEP],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '1112223334411111');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1('11122-233'),
      ).called(1);
    });
    testWidgets("render is void", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCEP],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();

      verifyNever(
        () => dumb.callWithParam1(''),
      );
    });
    testWidgets("render with letters", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagTextField = TagTextField(
        label: "Label",
        formatters: [TagMasks.maskCEP],
        onChanged: (value) => dumb.callWithParam1(value),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagTextField),
      );

      final Finder resultSearch = find.byType(TextField);

      await tester.enterText(resultSearch, 'nnnn');
      await tester.pumpAndSettle();

      verify(
        () => dumb.callWithParam1(''),
      ).called(1);
    });
  });
}
