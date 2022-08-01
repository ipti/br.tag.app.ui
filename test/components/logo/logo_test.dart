import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagLogo render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("LOGO_PATH_SVG", (WidgetTester tester) async {
      final tagLogo = TagLogo();

      await tester.pumpWidget(wrapMaterialAndBundle(tagLogo));
      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("test color", (WidgetTester tester) async {
      final tagLogo = TagLogo(
        color: Colors.amber,
        alignment: Alignment.centerLeft,
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapMaterialAndBundle(tagLogo));
      final Finder resultSearch = find.byType(TagLogo);

      final TagLogo cor = tester.widget<TagLogo>(resultSearch);

      expect(cor.color, equals(Colors.amber));
      final TagLogo alinhamento = tester.widget<TagLogo>(resultSearch);

      expect(alinhamento.alignment, equals(Alignment.centerLeft));
    });
    testWidgets("test width and height", (WidgetTester tester) async {
      final tagLogo = TagLogo(
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapMaterialAndBundle(tagLogo));
      final Finder resultSearch = find.byType(TagLogo);

      final TagLogo widthTest = tester.widget<TagLogo>(resultSearch);
      final TagLogo heightTest = tester.widget<TagLogo>(resultSearch);

      expect(widthTest.width, equals(40));
      expect(heightTest.height, equals(40));
    });
  });
}
