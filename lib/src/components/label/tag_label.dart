import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

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
