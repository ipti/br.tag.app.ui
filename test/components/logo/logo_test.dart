import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagLogo ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render LOGO_PATH_SVG", (WidgetTester tester) async {
      final tagLogo = TagLogo();

      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(tagLogo),
      );
      final Finder resultSearch = find.byType(SvgPicture);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render with color and alignment", (WidgetTester tester) async {
      final tagLogo = TagLogo(
        color: Colors.amber,
        alignment: Alignment.centerLeft,
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(tagLogo),
      );
      final Finder resultSearch = find.byType(TagLogo);

      final TagLogo corResult = tester.widget<TagLogo>(resultSearch);

      expect(
        corResult.color,
        equals(Colors.amber),
      );
      final TagLogo alinhamentoResult = tester.widget<TagLogo>(resultSearch);

      expect(
        alinhamentoResult.alignment,
        equals(Alignment.centerLeft),
      );
    });
    testWidgets("render with width and height", (WidgetTester tester) async {
      final tagLogo = TagLogo(
        width: 40,
        height: 40,
      );

      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(tagLogo),
      );
      final Finder resultSearch = find.byType(TagLogo);

      final TagLogo widthResult = tester.widget<TagLogo>(resultSearch);
      final TagLogo heightResult = tester.widget<TagLogo>(resultSearch);

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
