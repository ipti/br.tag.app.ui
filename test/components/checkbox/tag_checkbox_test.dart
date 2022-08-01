import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/checkbox/tag_checkbox.dart';
import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagCheckbox render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("With VALUE false ", (WidgetTester tester) async {
      final tagCheckbox = TagCheckbox(
        onChanged: (valor) {},
        label: "MyCheckbox",
        value: false,
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);
      final TagCheckbox checkbox = tester.widget<TagCheckbox>(resultSearch);

      expect(checkbox.value, equals(false));
    });
    testWidgets("when value changed", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.callWithParam1(value),
        label: "MyCheckbox",
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1(any(that: isTrue))).called(1);

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verify(() => dumb.callWithParam1(any(that: isFalse))).called(1);
    });
    testWidgets("With DISABLED true", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.callWithParam1(value),
        label: "MyCheckbox",
        disabled: true,
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verifyNever(() => dumb.callWithParam1(any()));
    });
    testWidgets("Only with text", (WidgetTester tester) async {
      final tagCheckbox = TagCheckbox(
        onChanged: (bool? valor) {},
        label: "MyCheckbox",
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("when value changed  in checkbox", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.callWithParam1(value),
        label: "MyCheckbox",
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(Checkbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verifyInOrder([
        () => dumb.callWithParam1(any(that: isTrue)),
        () => dumb.callWithParam1(any(that: isFalse))
      ]);
    });
  });
}
