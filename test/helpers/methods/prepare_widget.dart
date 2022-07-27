import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const fakeSVG = '''
<svg viewBox="0 0 10 10">
  <rect x="0" y="0" width="10" height="10" />
</svg>''';

Widget wrapDirectionaly(widget) => Directionality(
      child: MediaQuery(
        data: MediaQueryData(),
        child: widget,
      ),
      textDirection: TextDirection.ltr,
    );

Widget wrapMaterialAndBundle(widget) => MaterialApp(
      home: DefaultAssetBundle(
        bundle: TestAssetBundle(),
        child: widget,
      ),
    );

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    if (key == 'assets/logo/logo_tag.svg') {
      return ByteData.view(Uint8List.fromList(utf8.encode(fakeSVG)).buffer);
    }
    return ByteData(0);
  }
}
