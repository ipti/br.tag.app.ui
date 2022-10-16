import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const fakeSVG = '''
<svg viewBox="0 0 10 10">
  <rect x="0" y="0" width="10" height="10" />
</svg>''';

Widget wrapWithBaseAppAndBundle(widget) => MaterialApp(
      home: DefaultAssetBundle(
        bundle: TestAssetBundle(),
        child: Scaffold(
          body: widget,
        ),
      ),
    );

Widget wrapWithBaseApp(widget) => MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    );

class TestAssetBundle extends CachingAssetBundle {
  final _fakeBytes = ByteData.view(Uint8List.fromList(
    utf8.encode(fakeSVG),
  ).buffer);
  @override
  Future<ByteData> load(String key) async {
    if (key.endsWith('assets/logo/logo_tag.svg')) {
      return _fakeBytes;
    }
    if (key.endsWith('assets/logo/logo_light_tag.svg')) {
      return _fakeBytes;
    }
    if (key.endsWith('assets/logo/logo_grey_tag.svg')) {
      return _fakeBytes;
    }

    return ByteData(0);
  }
}
