import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

void main() {
  testWidgets("Render Box test", (WidgetTester tester) async {
    const widget = TagBox(
      minHeight: 50,
      minWidth: 50,
      child: Text("Render", textDirection: TextDirection.ltr),
    );

    await tester.pumpWidget(widget);

    final titleFinder = find.text('Render');

    expect(titleFinder, findsOneWidget);
  });
  group("TagTextField: ", () {
    testWidgets("Render test", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Center(
              child: TagTextField(
                label: "input",
              ),
            ),
          ),
        ),
      );

      final titleFinder = find.text('input');

      expect(titleFinder, findsOneWidget);
    });

    testWidgets("changeValue test", (WidgetTester tester) async {
      late String value;
      const key = Key("TAG_TEXT_FIELD");
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Center(
              child: TagTextField(
                key: key,
                label: "input",
                onChanged: (v) => value = v,
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byKey(key), 'Soup');

      await tester.pump(Duration(milliseconds: 250));

      expect(value, 'Soup');
    });
    testWidgets("onEditingComplete test", (WidgetTester tester) async {
      late String value;
      const key = Key("TAG_TEXT_FIELD");
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Center(
              child: TagTextField(
                key: key,
                label: "input",
                onEditingComplete: () => value = 'Soup',
              ),
            ),
          ),
        ),
      );

      final field = find.byKey(key);

      await tester.enterText(field, 'Soup');

      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pump(Duration(milliseconds: 250));

      expect(value, 'Soup');
    });
  });
}
