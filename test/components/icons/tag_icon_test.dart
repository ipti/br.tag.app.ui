import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/components.dart';
import 'package:tag_ui/src/strings/file_paths.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagIcon ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagIcon = TagIcon(
        defaultVersionPath: FilePaths.LOGO_LIGHT_PATH_SVG,
        disabledVersionPath: FilePaths.LOGO_GREY_PATH_SVG,
      );
      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(tagIcon),
      );
      final Finder resultSearch = find.byType(SvgPicture);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render desabled true", (WidgetTester tester) async {
      final tagIcon = TagIcon(
        defaultVersionPath: FilePaths.LOGO_LIGHT_PATH_SVG,
        disabledVersionPath: FilePaths.LOGO_GREY_PATH_SVG,
        disabled: true,
      );
      await tester.pumpWidget(
        wrapWithBaseAppAndBundle(tagIcon),
      );
      final Finder resultSearch = find.byType(SvgPicture);
      expect(resultSearch, findsOneWidget);
    });
  });
}
