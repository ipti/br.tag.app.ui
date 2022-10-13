import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:tag_ui/tag_ui.dart';

import '../../helpers/methods/prepare_widget.dart';
import '../../helpers/mock/dumb.dart';

void main() {
  group("When TagEmpty ", () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets("render with default values", (WidgetTester tester) async {
      final tagEmpty = TagEmpty();
      await tester.pumpWidget(wrapWithBaseApp(tagEmpty));
      final Finder titleSearch = find.text("Essa lista está vazia");
      final Finder descriptionSearch = find
          .text("Você está sem conexão ou nenhum dado foi cadastrado ainda");
      expect(titleSearch, findsOneWidget);
      expect(descriptionSearch, findsOneWidget);
    });
    testWidgets("render with onPressedRetry", (WidgetTester tester) async {
      final tagEmpty = TagEmpty(onPressedRetry: () {});
      await tester.pumpWidget(wrapWithBaseApp(tagEmpty));
      final Finder titleSearch = find.text("Essa lista está vazia");
      final Finder descriptionSearch = find
          .text("Você está sem conexão ou nenhum dado foi cadastrado ainda");
      final Finder retryButtonSearch = find.byType(TagButton);

      expect(retryButtonSearch, findsOneWidget);
      expect(titleSearch, findsOneWidget);
      expect(descriptionSearch, findsOneWidget);
    });

    testWidgets("has tapped on retry button", (WidgetTester tester) async {
      final dumb = MockDumb();
      final tagEmpty = TagEmpty(onPressedRetry: () => dumb.call());
      await tester.pumpWidget(wrapWithBaseApp(tagEmpty));

      final Finder retryButtonSearch = find.byType(TagButton);
      expect(retryButtonSearch, findsOneWidget);

      await tester.tap(retryButtonSearch);

      verify(() => dumb.call()).called(1);
    });
  });
}
