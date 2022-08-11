import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/components.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When TagNumberField", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("Render", (WidgetTester tester) async {
      final tagNumberField = TagNumberField(
        onChanged: (){
      },);
      await tester.pumpWidget(wrapWithBaseApp(tagNumberField));
      final Finder resultSearch = find.byType(TagNumberField);
      expect(resultSearch, findsOneWidget);
    });
  });
}
