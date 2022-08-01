import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When LogoGreyTag render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("LOGO_PATH_SVG", (WidgetTester tester) async {
      final logoGreyTag = LogoGreyTag();

      await tester.pumpWidget(wrapMaterialAndBundle(logoGreyTag));
      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("test color", (WidgetTester tester) async {
      final logoGreyTag = LogoGreyTag(
        color: Colors.amber,
        alignment: Alignment.centerLeft,
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapMaterialAndBundle(logoGreyTag));
      final Finder resultSearch = find.byType(LogoGreyTag);

      final LogoGreyTag cor = tester.widget<LogoGreyTag>(resultSearch);

      expect(cor.color, equals(Colors.amber));
      final LogoGreyTag alinhamento = tester.widget<LogoGreyTag>(resultSearch);

      expect(alinhamento.alignment, equals(Alignment.centerLeft));
    });
    testWidgets("test width and height", (WidgetTester tester) async {
      final logoGreyTag = LogoGreyTag(
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapMaterialAndBundle(logoGreyTag));
      final Finder resultSearch = find.byType(LogoGreyTag);

      final LogoGreyTag widthTest = tester.widget<LogoGreyTag>(resultSearch);
      final LogoGreyTag heightTest = tester.widget<LogoGreyTag>(resultSearch);

      expect(widthTest.width, equals(40));
      expect(heightTest.height, equals(40));
    });
  });
}
