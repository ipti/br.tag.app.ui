import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagNumberField", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("Render", (WidgetTester tester) async {
      final tagNumberField = TagNumberField(
        onChanged: () {},
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      final Finder resultSearch = find.byType(TagNumberField);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("tap button +", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      final Finder resultSearch = find.widgetWithIcon(TextButton, Icons.add);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      verify(() => dumb.callWithParam1(any())).called(1);
    });
    testWidgets("tap button -", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      final Finder resultSearch = find.widgetWithIcon(TextButton, Icons.add);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      final Finder resultSearchRemove =
          find.widgetWithIcon(TextButton, Icons.remove);
      await tester.tap(resultSearchRemove);
      await tester.pumpAndSettle();
      verify(() => dumb.callWithParam1(any())).called(2);
    });
    testWidgets("tap button - onChanged not called",
        (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      final Finder resultSearch = find.widgetWithIcon(TextButton, Icons.remove);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      verifyNever(() => dumb.callWithParam1(any()));
    });
    testWidgets("tap button - value is not changed",
        (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      final Finder resultSearch = find.widgetWithIcon(TextButton, Icons.remove);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });
    testWidgets("tap button + value is changed", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      expect(find.text('0'), findsOneWidget);
      await tester.pumpAndSettle();
      final Finder resultSearch = find.widgetWithIcon(TextButton, Icons.add);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
    testWidgets("digits a number", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      expect(find.text('0'), findsOneWidget);
      await tester.pumpAndSettle();
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, '1');
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);
    });
    testWidgets("digits '' ", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      expect(find.text('0'), findsOneWidget);
      await tester.pumpAndSettle();
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, '');
      await tester.pumpAndSettle();
      expect(find.text(''), findsOneWidget);
    });
    testWidgets("digits a text ", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(any())).thenAnswer((invocation) {});
      final tagNumberField = TagNumberField(
        onChanged: (value) {
          dumb.callWithParam1(value);
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      expect(find.text('0'), findsOneWidget);
      await tester.pumpAndSettle();
      final Finder resultSearch = find.byType(TextField);
      await tester.enterText(resultSearch, 'oito');
      await tester.pumpAndSettle();
      expect(find.text(''), findsOneWidget);
    });
  });
}
