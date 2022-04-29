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
}
