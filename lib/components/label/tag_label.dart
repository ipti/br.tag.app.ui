import 'package:flutter/material.dart';
import 'package:tag_ui/design_tokens/font_size.dart';
import 'package:tag_ui/design_tokens/font_weight.dart';
import 'package:tag_ui/design_tokens/line_height.dart';

class TagLabel extends StatelessWidget {
  const TagLabel(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: TagFontSize.fontSizeFormLabel,
      fontWeight: TagFontWeight.fontWeightNormal,
      height: TagLineHeight.lineHeightHeading,
    );

    return Text(
      text,
      style: style,
      textDirection: TextDirection.ltr,
    );
  }
}
