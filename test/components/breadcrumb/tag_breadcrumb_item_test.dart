import 'package:flutter_test/flutter_test.dart';
import 'package:tag_ui/src/components/breadcrumb/tag_breadcrumb_item.dart';

import '../../helpers/methods/prepare_widget.dart';

void main() {
  group("When ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("TagBreadcrumbItem render", (WidgetTester tester) async {
      final tagBreadcrumbItem = TagBreadcrumbItem(
        title: 'home',
      );
      await tester.pumpWidget(wrapMaterial(tagBreadcrumbItem));
      final Finder resultSearch = find.byType(TagBreadcrumbItem);

      expect(resultSearch, findsOneWidget);
    });
  });
}
