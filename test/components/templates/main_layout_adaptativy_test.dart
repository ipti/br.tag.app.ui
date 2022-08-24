import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When  MainLayoutAdaptativy", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render", (WidgetTester tester) async {
      final mainLayoutAdaptativy = MainLayoutAdaptativy();
      await tester.pumpWidget(wrapWithBaseApp(mainLayoutAdaptativy));

      final Finder resultSearch = find.byType(MainLayoutAdaptativy);

      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render left on Desktop ", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(1440, 900));
      final mainLayoutAdaptativy = MainLayoutAdaptativy(
        left: Container(
          key: Key("Desktop"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(mainLayoutAdaptativy));

      final Finder sizeResult = find.byKey(Key("Desktop"));
      expect(sizeResult, findsOneWidget);
    });
    testWidgets("render right on Desktop", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(1440, 900));
      final mainLayoutAdaptativy = MainLayoutAdaptativy(
        right: Container(
          key: Key("Desktop"),
        ),
      );
      await tester.pumpWidget(wrapWithBaseApp(mainLayoutAdaptativy));

      final Finder sizeResult = find.byKey(Key("Desktop"));
      expect(sizeResult, findsOneWidget);
    });
    testWidgets("render appBar on mobile", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(Size(360, 760));
      final mainLayoutAdaptativy = MainLayoutAdaptativy(
          appBar: TagAppBar(
        key: Key("Desktop"),
      ));
      await tester.pumpWidget(wrapWithBaseApp(mainLayoutAdaptativy));
      final Finder sizeResult = find.byKey(Key("Desktop"));
      expect(sizeResult, findsOneWidget);
    });

    // testWidgets("render on Desktop", (WidgetTester tester) async {
    //   tester.binding.window.physicalSizeTestValue = Size(1440, 900);
    //   tester.binding.window.devicePixelRatioTestValue = 1.0;
    //   await tester.binding.setSurfaceSize(Size(1440, 900));
    //   final mainLayoutAdaptativy = MainLayoutAdaptativy(
    //       left: Container(
    //         key: Key("Desktop"),
    //       ),
    //       right: Container(
    //         key: Key("Desktop"),
    //       ),
    //       body: Container(
    //         key: Key("Desktop"),
    //       ),
    //       appBar: TagAppBar(
    //         key: Key("Desktop"),
    //       ));
    //   await tester.pumpWidget(wrapWithBaseApp(mainLayoutAdaptativy));

    //   final Finder sizeResult = find.byKey(Key("Desktop"));
    //   expect(sizeResult, findsNWidgets(3));
    // });
    //     testWidgets("render", (WidgetTester tester) async {
    //   tester.binding.window.physicalSizeTestValue = Size(1440, 900);
    //   tester.binding.window.devicePixelRatioTestValue = 1.0;
    //   await tester.binding.setSurfaceSize(Size(1440, 900));
    //   final mainLayoutAdaptativy = MainLayoutAdaptativy();
    //   await tester.pumpWidget(wrapWithBaseApp(mainLayoutAdaptativy));

    //   final Finder resultSearch = find.byWidget(LayoutLeftBodyRight(body: Container()));

    //   expect(resultSearch, findsOneWidget);
    // });
  });
}