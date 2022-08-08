import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When LogoLightTag render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("LOGO_PATH_SVG", (WidgetTester tester) async {
      final logoLightTag = LogoLightTag();

      await tester.pumpWidget(wrapWithBaseAppAndBundle(logoLightTag));
      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("test color", (WidgetTester tester) async {
      final logoLightTag = LogoLightTag(
        color: Colors.amber,
        alignment: Alignment.centerLeft,
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapWithBaseAppAndBundle(logoLightTag));
      final Finder resultSearch = find.byType(LogoLightTag);

      final LogoLightTag cor = tester.widget<LogoLightTag>(resultSearch);

      expect(cor.color, equals(Colors.amber));
      final LogoLightTag alinhamento =
          tester.widget<LogoLightTag>(resultSearch);

      expect(alinhamento.alignment, equals(Alignment.centerLeft));
    });
    testWidgets("test width and height", (WidgetTester tester) async {
      final logoLightTag = LogoLightTag(
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapWithBaseAppAndBundle(logoLightTag));
      final Finder resultSearch = find.byType(LogoLightTag);

      final LogoLightTag widthTest = tester.widget<LogoLightTag>(resultSearch);
      final LogoLightTag heightTest = tester.widget<LogoLightTag>(resultSearch);

      expect(widthTest.width, equals(40));
      expect(heightTest.height, equals(40));
    });
  });
}
