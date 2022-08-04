import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';

Future<TestGesture> hoverIn(WidgetTester tester, Finder item) async {
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  await gesture.addPointer(location: Offset.zero);
  await tester.pump();
  await gesture.moveTo(tester.getCenter(item));
  await tester.pumpAndSettle();
  return gesture;
}

hoverAutoRemove(WidgetTester tester, Finder item) async {
  final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
  addTearDown(gesture.removePointer);
  await gesture.addPointer(location: Offset.zero);
  await tester.pump();
  await gesture.moveTo(tester.getCenter(item));
  await tester.pumpAndSettle();
}
