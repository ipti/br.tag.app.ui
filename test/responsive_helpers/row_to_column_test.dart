import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../helpers/methods/prepare_widget.dart';

void main() {
  group("When RowToColumn ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render", (WidgetTester tester) async {
      final rowToColumn = RowToColumn(
        children: [],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(rowToColumn),
      );
      final Finder resultSearch = find.byType(RowToColumn);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render desktop dont  find column",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final rowToColumn = RowToColumn(
        children: [Container()],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(rowToColumn),
      );
      final Finder resultSearch = find.byType(Column);
      expect(resultSearch, findsNothing);
    });

    testWidgets("render desktop find row", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final rowToColumn = RowToColumn(
        children: [Container()],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(rowToColumn),
      );
      final Finder resultSearch = find.byType(Row);
      expect(resultSearch, findsOneWidget);
    });

    testWidgets("render mobile find column", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final rowToColumn = RowToColumn(
        children: [Container()],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(rowToColumn),
      );
      final Finder resultSearch = find.byType(Column);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render mobile find row", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final rowToColumn = RowToColumn(
        children: [Container()],
      );
      await tester.pumpWidget(
        wrapWithBaseApp(rowToColumn),
      );
      final Finder resultSearch = find.byType(Row);
      expect(resultSearch, findsOneWidget);
    });
  });
}
