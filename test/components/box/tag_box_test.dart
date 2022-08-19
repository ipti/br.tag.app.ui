import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagBox render", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets("A nomear", (WidgetTester tester) async {
      final tagBox = TagBox(
        child: Text("Texto"),
        minHeight: 0,
        minWidth: 0,
        background: Color(0xAA),
        padding: EdgeInsets.all(16.0),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagBox));

      final Finder resultSearch = find.byType(TagBox);

      final TagBox box = tester.widget<TagBox>(resultSearch);

      expect(box.minHeight, equals(0));
      expect(box.minWidth, equals(0));
      expect(box.background, equals(Color(0xAA)));
      expect(box.padding, equals(EdgeInsets.all(16.0)));
    });
    testWidgets("A nomear", (WidgetTester tester) async {
      final tagBox = TagBox(
        child: Text("Texto"),
      );
      await tester.pumpWidget(wrapWithBaseApp(tagBox));

      final Finder resultSearch = find.byType(TagBox);

      expect(resultSearch, findsOneWidget);
    });
  });
}
