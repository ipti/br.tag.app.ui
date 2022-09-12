import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When LogoGreyTag ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render LOGO_PATH_SVG", (WidgetTester tester) async {
      final logoGreyTag = LogoGreyTag();

      await tester.pumpWidget(wrapWithBaseAppAndBundle(logoGreyTag));
      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with color and alignment", (WidgetTester tester) async {
      final logoGreyTag = LogoGreyTag(
        color: Colors.amber,
        alignment: Alignment.centerLeft,
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapWithBaseAppAndBundle(logoGreyTag));
      final Finder resultSearch = find.byType(LogoGreyTag);

      final LogoGreyTag corResult = tester.widget<LogoGreyTag>(resultSearch);

      expect(corResult.color, equals(Colors.amber));
      final LogoGreyTag alinhamentoResult =
          tester.widget<LogoGreyTag>(resultSearch);

      expect(alinhamentoResult.alignment, equals(Alignment.centerLeft));
    });
    testWidgets("render with width and height", (WidgetTester tester) async {
      final logoGreyTag = LogoGreyTag(
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(wrapWithBaseAppAndBundle(logoGreyTag));
      final Finder resultSearch = find.byType(LogoGreyTag);

      final LogoGreyTag widthTestResult =
          tester.widget<LogoGreyTag>(resultSearch);
      final LogoGreyTag heightTestResult =
          tester.widget<LogoGreyTag>(resultSearch);

      expect(widthTestResult.width, equals(40));
      expect(heightTestResult.height, equals(40));
    });
  });
}
