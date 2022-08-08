import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When label is render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets(" with text", (WidgetTester tester) async {
      final tagLabel = TagLabel("Texto");
      await tester.pumpWidget(wrapWithBaseApp(tagLabel));
      final Finder resultSearch = find.text("Texto");
      final textoLabel = tester.widget<Text>(resultSearch);
      expect(textoLabel.style?.fontSize, equals(TagFontSize.fontSizeFormLabel));
      expect(textoLabel.style?.height, equals(TagLineHeight.lineHeightHeading));
      expect(
          textoLabel.style?.fontWeight, equals(TagFontWeight.fontWeightNormal));
    });
  });
}
