import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When Heading ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render whit displayTitle", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.DisplayTitle,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingDisplay),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseInkNormal,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingDisplay),
      );
    });
    testWidgets("render with displaySubtitle", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.DisplaySubtitle,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingDisplaySubtitle),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseInkNormal,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingDisplaySubtitle),
      );
    });
    testWidgets("render whit Title1", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title1,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingTitle1),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseInkNormal,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingTitle1),
      );
    });
    testWidgets("render whit Title2", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title2,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingTitle2),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseCloudLightActive,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingTitle2),
      );
    });
    testWidgets("render whit Title3", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title3,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingTitle3),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseInkNormal,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingTitle3),
      );
    });
    testWidgets("render whit Title4", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title4,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingTitle4),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseInkNormal,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingTitle4),
      );
    });
    testWidgets("render whit Title5", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title5,
      );
      await tester.pumpWidget(
        wrapWithBaseApp(heading),
      );
      final Finder resultSearch = find.text("Texto");
      final textoHeadingResult = tester.widget<Text>(resultSearch);
      expect(
        textoHeadingResult.style?.fontSize,
        equals(TagFontSize.fontSizeHeadingTitle5),
      );
      expect(
        textoHeadingResult.style?.color,
        equals(
          TagColors.colorBaseInkNormal,
        ),
      );
      expect(
        textoHeadingResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightHeadingTitle5),
      );
    });
  });
}
