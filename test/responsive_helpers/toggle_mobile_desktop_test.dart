import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../helpers/methods/SizeDestopMobile.dart';
import '../helpers/methods/prepare_widget.dart';

void main() {
  group("When ToggleMobileDesktop ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final toggleMobileDesktop = ToggleMobileDesktop(
        mobile: Container(
          key: Key("Mobile"),
          width: 200,
        ),
        desktop: Container(key: Key("Desktop"), width: 992),
      );
      await tester.pumpWidget(wrapWithBaseApp(toggleMobileDesktop));

      final Finder resultSearch = find.byType(ToggleMobileDesktop);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render mobile", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(360, 900));
      final toggleMobileDesktop = ToggleMobileDesktop(
        mobile: Container(
          key: Key("Mobile"),
        ),
        desktop: Container(key: Key("Desktop")),
      );
      await tester.pumpWidget(wrapWithBaseApp(toggleMobileDesktop));
      final Finder resultSearchSizeResult = find.byKey(Key("Mobile"));

      expect(resultSearchSizeResult, findsOneWidget);
    });
    testWidgets("render desktop", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(1440, 900));
      // await screenSizeDesktop(tester);
      ///TODO tentar fazer a modularização do tamanho da tela
      final toggleMobileDesktop = ToggleMobileDesktop(
        mobile: Container(
          key: Key("Mobile"),
        ),
        desktop: Container(
          key: Key("Desktop"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(toggleMobileDesktop));
      final Finder resultSearchSizeResult = find.byKey(Key("Desktop"));
      expect(resultSearchSizeResult, findsOneWidget);
    });
  });
}
