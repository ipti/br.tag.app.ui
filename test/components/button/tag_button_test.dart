import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tag_ui/src/strings/file_paths.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagButton ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render only with text ", (WidgetTester tester) async {
      final tagButton = TagButton(text: "MyButton", onPressed: () {});
      await tester.pumpWidget(wrapWithBaseApp(tagButton));
      final Finder resultSearch = find.byType(TagButton);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with backgroundColor amber",
        (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        backgroundColor: Colors.amber,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));
      final Finder resultSearch = find.byType(TagButton);
      final TagButton resultButton = tester.widget<TagButton>(resultSearch);
      expect(resultButton.backgroundColor, equals(Colors.amber));
    });
    testWidgets("render with icon LOGO_PATH_SVG", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        icon: FilePaths.LOGO_PATH_SVG,
      );

      await tester.pumpWidget(wrapWithBaseAppAndBundle(tagButton));

      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with TextButtonColor amber",
        (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        textButtonColor: Colors.amber,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));
      final Finder resultSearch = find.byType(TagButton);
      final TagButton resultButton = tester.widget<TagButton>(resultSearch);
      expect(resultButton.textButtonColor, equals(Colors.amber));
    });
    testWidgets("render with TextStyle", (WidgetTester tester) async {
      final tagButton = TagButton(
          text: "MyButton",
          onPressed: () {},
          textStyle: TagTextStyles.textButtonPrimary);
      await tester.pumpWidget(wrapWithBaseApp(tagButton));
      final Finder resultSearch = find.byType(ElevatedButton);
      final ElevatedButton resultButton =
          tester.widget<ElevatedButton>(resultSearch);
      expect(resultButton.child, equals(TagTextStyles.textButtonPrimary));
      //No debugger mostra que style está dentro de child, mas porque eu não tenho acesso? 

    });

    testWidgets("render with ButtonStyle", (WidgetTester tester) async {
      final tagButton = TagButton(
        text: "MyButton",
        onPressed: () {},
        buttonStyle: TagButtonStyles.primary,
      );
      await tester.pumpWidget(wrapWithBaseApp(tagButton));
      final Finder resultSearch = find.byType(ElevatedButton);
      final ElevatedButton resultButton =
          tester.widget<ElevatedButton>(resultSearch);
      expect(resultButton.style, equals(TagButtonStyles.primary));
    });
    testWidgets("is tapped", (WidgetTester tester) async {
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
