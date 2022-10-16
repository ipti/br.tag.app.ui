import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagLabel", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("is render with text", (WidgetTester tester) async {
      final tagLabel = TagLabel("Texto");
      await tester.pumpWidget(
        wrapWithBaseApp(tagLabel),
      );
      final Finder resultSearch = find.text("Texto");
      final textoLabelResult = tester.widget<Text>(resultSearch);
      expect(
        textoLabelResult.style?.fontSize,
        equals(TagFontSize.fontSizeFormLabel),
      );
      expect(
        textoLabelResult.style?.height,
        equals(TagLineHeight.lineHeightHeading),
      );
      expect(
        textoLabelResult.style?.fontWeight,
        equals(TagFontWeight.fontWeightNormal),
      );
    });
  });
}
