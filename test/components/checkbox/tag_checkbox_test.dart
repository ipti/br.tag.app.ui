import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/checkbox/tag_checkbox.dart';
import '../../helpers/methods/prepare_widget.dart';

class Dumb {
  void call(param) {}
}

class MockDumb extends Mock implements Dumb {}

void main() {
  group("When TagCheckbox render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("With VALUE false ", (WidgetTester tester) async {
      final tagCheckbox = TagCheckbox(
        onChanged: ( valor) {},
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
      when(() => dumb.call(any())).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.call(value),
        label: "MyCheckbox",
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verify(() => dumb.call(any(that: isTrue))).called(1);

      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verify(() => dumb.call(any(that: isFalse))).called(1);
    });
    testWidgets("With DISABLED true", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.call(any())).thenAnswer((invocation) {});
      final tagCheckbox = TagCheckbox(
        onChanged: (value) => dumb.call(value),
        label: "MyCheckbox",
        disabled: true,
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();

      verifyNever(() => dumb.call(any()));
    });
    testWidgets("Oly with text", (WidgetTester tester) async {
      final tagCheckbox = TagCheckbox(
        onChanged: (bool? valor) {},
        label: "MyCheckbox",
      );

      await tester.pumpWidget(wrapMaterial(tagCheckbox));

      final Finder resultSearch = find.byType(TagCheckbox);

      expect(resultSearch, findsOneWidget);
    });
  });
}
