import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> screenSizeDesktop(WidgetTester tester) async {
  var tester;
  tester.binding.window.physicalSizeTestValue = Size(1440, 900);
  tester.binding.window.devicePixelRatioTestValue = 1.0;
  await tester.binding.setSurfaceSize(Size(1440, 900));
  return tester;
}

Future<void> screenSizeMobile(WidgetTester tester) async {
  var tester;
  tester.binding.window.physicalSizeTestValue = Size(1440, 900);
  tester.binding.window.devicePixelRatioTestValue = 1.0;
  await tester.binding.setSurfaceSize(Size(1440, 900));
  return tester;
}
