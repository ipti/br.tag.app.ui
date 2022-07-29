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
        type: HeadingType.DisplaySubtitle,
      );
      await tester.pumpWidget(wrapMaterial(heading));
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
  });
}
