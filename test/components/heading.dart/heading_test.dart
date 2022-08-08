import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When heading is render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("DisplayTitle", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.DisplayTitle,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingDisplay));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseInkNormal,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingDisplay));
    });
    testWidgets("DisplaySubtitle", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.DisplaySubtitle,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingDisplaySubtitle));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseInkNormal,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingDisplaySubtitle));
    });
    testWidgets("Title1", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title1,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingTitle1));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseInkNormal,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingTitle1));
    });
    testWidgets("Title2", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title2,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingTitle2));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseCloudLightActive,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingTitle2));
    });
    testWidgets("Title3", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title3,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingTitle3));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseInkNormal,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingTitle3));
    });
    testWidgets("Title4", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title4,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingTitle4));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseInkNormal,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingTitle4));
    });
    testWidgets("Title5", (WidgetTester tester) async {
      final heading = Heading(
        text: "Texto",
        type: HeadingType.Title5,
      );
      await tester.pumpWidget(wrapWithBaseApp(heading));
      final Finder resultSearch = find.text("Texto");
      final textoHeading = tester.widget<Text>(resultSearch);
      expect(textoHeading.style?.fontSize,
          equals(TagFontSize.fontSizeHeadingTitle5));
      expect(
          textoHeading.style?.color,
          equals(
            TagColors.colorBaseInkNormal,
          ));
      expect(textoHeading.style?.fontWeight,
          equals(TagFontWeight.fontWeightHeadingTitle5));
    });
  });
}
