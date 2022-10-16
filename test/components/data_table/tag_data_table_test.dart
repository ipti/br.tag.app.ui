import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/data_source.dart';
import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagDataTable", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("render", (WidgetTester tester) async {
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valorees"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearch = find.byType(TagDataTable);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("render column in desktp", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchColumn = find.text("Valores");
      expect(resultSearchColumn, findsOneWidget);
    });
    testWidgets("no render column in desktp", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchColumn = find.text("Valores");
      expect(resultSearchColumn, findsNothing);
    });
    testWidgets("render cells in desktp", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      expect(resultSearchCell, findsOneWidget);
    });
    testWidgets("render cells in mobile", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      expect(resultSearchCell, findsOneWidget);
    });
    testWidgets("render scroll in desktop if there a lot of elements",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
          "ola",
          "eu",
          "sou",
          "uma",
          "batata",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      final positionInitial = tester.getCenter(resultSearchCell);
      expect(resultSearchCell, findsOneWidget);
      await tester.drag(
        resultSearchCell,
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();
      final positionFinal = tester.getCenter(
        find.text("oi"),
      );
      expect(
        positionInitial.dy,
        greaterThan(positionFinal.dy),
      );
    });
    testWidgets("render no scroll in desktop if there not a lot of elements",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      final positionInitial = tester.getCenter(resultSearchCell);
      expect(resultSearchCell, findsOneWidget);
      await tester.drag(
        resultSearchCell,
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();
      final positionFinal = tester.getCenter(
        find.text("oi"),
      );
      expect(
        positionInitial.dy,
        equals(positionFinal.dy),
      );
    });
    testWidgets("render scroll in mobile if there a lot of elements",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
          "ola",
          "eu",
          "sou",
          "uma",
          "batata",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      final positionInitial = tester.getCenter(resultSearchCell);
      expect(resultSearchCell, findsOneWidget);
      await tester.drag(
        resultSearchCell,
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();
      final positionFinal = tester.getCenter(
        find.text("oi"),
      );
      expect(
        positionInitial.dy,
        greaterThan(positionFinal.dy),
      );
    });
    testWidgets("render no scroll in mobile if there not a lot of elements",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      final positionInitial = tester.getCenter(resultSearchCell);
      expect(resultSearchCell, findsOneWidget);
      await tester.drag(
        resultSearchCell,
        const Offset(0, -100),
      );
      await tester.pumpAndSettle();
      final positionFinal = tester.getCenter(
        find.text("oi"),
      );
      expect(
        positionInitial.dy,
        equals(positionFinal.dy),
      );
    });
    testWidgets("render cells null", (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource(['gfhfgg'], nullrow: true),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.byType(Container);
      expect(
        resultSearchCell,
        findsNWidgets(2),
      );
    });
    testWidgets("tap in the cell", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        onTapRow: (rowIndex) => dumb.callWithParam1(rowIndex),
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      await tester.tap(resultSearchCell);
      verify(
        () => dumb.callWithParam1(0),
      ).called(1);
    });
    testWidgets("", (WidgetTester tester) async {
      final dumb = MockDumb();
      when(() => dumb.callWithParam1(
            any(),
          )).thenAnswer((invocation) {});
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        onTapRow: (rowIndex) => dumb.callWithParam1(rowIndex),
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      await tester.tap(resultSearchCell);
      verify(
        () => dumb.callWithParam1(0),
      ).called(1);
    });
    testWidgets("render elements one above the other in mobile ",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(360, 760);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(360, 760),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      final Finder resultSearchIndex = find.text("0");
      final positionCell = tester.getCenter(resultSearchCell);
      final positionIndex = tester.getCenter(resultSearchIndex);
      expect(
        positionIndex.dy,
        lessThan(positionCell.dy),
      );
    });
    testWidgets("render elements  next to each other in desktop ",
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1440, 900);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      await tester.binding.setSurfaceSize(
        Size(1440, 900),
      );
      final tagDataTable = TagDataTable(
        columns: [
          DataColumn(
            label: Text("Valores"),
          )
        ],
        source: DataSource([
          "oi",
          "eu",
          "sou",
          "uma",
          "tabela",
        ]),
      );
      await tester.pumpWidget(
        wrapWithBaseApp(tagDataTable),
      );
      final Finder resultSearchCell = find.text("oi");
      final Finder resultSearchIndex = find.text("0");
      final positionCell = tester.getCenter(resultSearchCell);
      final positionIndex = tester.getCenter(resultSearchIndex);
      expect(
        positionIndex.dy,
        equals(positionCell.dy),
      );
    });
  });
}
