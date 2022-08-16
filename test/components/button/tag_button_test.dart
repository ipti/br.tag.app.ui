import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/strings/file_paths.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagButton render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("Only with text ", (WidgetTester tester) async {
      final tagButton = TagButton(text: "MyButton", onPressed: () {});

      await tester.pumpWidget(wrapWithBaseApp(tagButton));

      final Finder resultSearch = find.byType(TagButton);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("With backgroundColor amber", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        backgroundColor: Colors.amber,
      );

      await tester.pumpWidget(wrapWithBaseApp(tagButton));

      final Finder resultSearch = find.byType(TagButton);

      final TagButton button = tester.widget<TagButton>(resultSearch);

      expect(button.backgroundColor, equals(Colors.amber));
    });
    testWidgets("with icon LOGO_PATH_SVG", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        icon: FilePaths.LOGO_PATH_SVG,
      );

      await tester.pumpWidget(wrapWithBaseAppAndBundle(tagButton));

      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("With TextButtonColor amber", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        textButtonColor: Colors.amber,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));

      final Finder resultSearch = find.byType(TagButton);

      final TagButton button = tester.widget<TagButton>(resultSearch);

      expect(button.textButtonColor, equals(Colors.amber));
    });
    testWidgets("With TextStyle bold", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));

      final Finder resultSearch = find.byType(TagButton);

      final TagButton button = tester.widget<TagButton>(resultSearch);

      expect(button.textStyle, equals(TextStyle(fontWeight: FontWeight.bold)));
    });
    testWidgets("With ButtonStyle bold", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        buttonStyle: TagButtonStyles.secondary,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));

      final Finder resultSearch = find.byType(TagButton);

      final TagButton button = tester.widget<TagButton>(resultSearch);

      expect(button.buttonStyle, equals(TagButtonStyles.secondary));
    });
    testWidgets("tap it", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.call()).thenAnswer((invocation) {});
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {
          dumb.call();
        },
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));
      final Finder resultSearch = find.byType(TagButton);
      await tester.tap(resultSearch);
      await tester.pumpAndSettle();
      verify(() => dumb.call()).called(1);
    });
  });
}
