import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("TagMenu render", (WidgetTester tester) async {
      final tagMenu = TagMenu(
        items: [],
      );
      await tester.pumpWidget(wrapWithBaseApp(tagMenu));
      final Finder resultSearch = find.byType(TagMenu);
      expect(resultSearch, findsOneWidget);
    });
    testWidgets("TagMenu with itens", (WidgetTester tester) async {
      final tagMenu = TagMenu(
        items: [
          for (var i = 0; i < 30; i++)
            TagMenuItem(
              onTap: (rota) {},
              title: "titulo $i",
              route: "",
            ),
        ],
      );
      await tester.pumpWidget(wrapWithBaseApp(tagMenu));
      final Finder resultSearch = find.byType(TagMenuItem);
      expect(resultSearch, findsWidgets);
    });
  });
}
