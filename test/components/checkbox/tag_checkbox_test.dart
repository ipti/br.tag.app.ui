import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/checkbox/tag_checkbox.dart';
import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagCheckbox ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render with VALUE false ", (WidgetTester tester) async {
      final tagCheckbox = TagCheckbox(
        onChanged: (valor) {},
        label: "MyCheckbox",
        value: false,
      );

      await tester.pumpWidget(
        wrapWithBaseApp(tagCheckbox),
      );

      final Finder resultSearch = find.byType(TagCheckbox);
      final TagCheckbox checkbox = tester.widget<TagCheckbox>(resultSearch);

      expect(
        checkbox.value,
        equals(false),
      );
    });
    testWidgets("render when value changed", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.callWithParam1(value),
        label: "MyCheckbox",
      );

      await tester.pumpWidget(
        wrapWithBaseApp(tagCheckbox),
      );

      final Finder resultSearch = find.byType(TagCheckbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1(
            any(that: isTrue),
          )).called(1);

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1(
            any(that: isFalse),
          )).called(1);
    });
    testWidgets("render with DISABLED true", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.callWithParam1(value),
        label: "MyCheckbox",
        disabled: true,
      );

      await tester.pumpWidget(
        wrapWithBaseApp(tagCheckbox),
      );

      final Finder resultSearch = find.byType(TagCheckbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verifyNever(() => dumb.callWithParam1(
            any(),
          ));
    });
    testWidgets("render only with text", (WidgetTester tester) async {
      final tagCheckbox = TagCheckbox(
        onChanged: (bool? valor) {},
        label: "MyCheckbox",
      );

      await tester.pumpWidget(
        wrapWithBaseApp(tagCheckbox),
      );

      final Finder resultSearch = find.byType(TagCheckbox);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render when value changed  in checkbox",
        (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.callWithParam1(value),
        label: "MyCheckbox",
      );

      await tester.pumpWidget(
        wrapWithBaseApp(tagCheckbox),
      );

      final Finder resultSearch = find.byType(Checkbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verifyInOrder([
        () => dumb.callWithParam1(
              any(that: isTrue),
            ),
        () => dumb.callWithParam1(
              any(that: isFalse),
            )
      ]);
    });
  });
}
