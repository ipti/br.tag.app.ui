import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When LogoLightTag ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render LOGO_PATH_SVG", (WidgetTester tester) async {
      final logoLightTag = LogoLightTag();

      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(logoLightTag),
      );
      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with color and alignment", (WidgetTester tester) async {
      final logoLightTag = LogoLightTag(
        color: Colors.amber,
        alignment: Alignment.centerLeft,
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(logoLightTag),
      );
      final Finder resultSearch = find.byType(LogoLightTag);

      final LogoLightTag corResult = tester.widget<LogoLightTag>(resultSearch);

      expect(
        corResult.color,
        equals(Colors.amber),
      );
      final LogoLightTag alinhamentoResult =
          tester.widget<LogoLightTag>(resultSearch);

      expect(
        alinhamentoResult.alignment,
        equals(Alignment.centerLeft),
      );
    });
    testWidgets("render with width and height", (WidgetTester tester) async {
      final logoLightTag = LogoLightTag(
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(logoLightTag),
      );
      final Finder resultSearch = find.byType(LogoLightTag);

      final LogoLightTag widthResult =
          tester.widget<LogoLightTag>(resultSearch);
      final LogoLightTag heightResult =
          tester.widget<LogoLightTag>(resultSearch);

      expect(
        widthResult.width,
        equals(40),
      );
      expect(
        heightResult.height,
        equals(40),
      );
    });
  });
}
