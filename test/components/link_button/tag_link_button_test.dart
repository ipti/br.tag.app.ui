import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagLinkButton ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      ///TODO: Revisar se precisa alguma coisa nesse
    });
    testWidgets("render", (WidgetTester tester) async {
      final tagLinkButton = TagLinkButton(
        text: "MyButton",
        onPressed: () {},
      );
      await tester.pumpWidget(wrapWithBaseApp(tagLinkButton));
      final Finder resultSearch = find.text("MyButton");
      expect(resultSearch, findsOneWidget);
    });
  });
}
