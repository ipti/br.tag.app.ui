import 'package:flutter/widgets.dart';

String? fromRichTextToPlainText(final Widget widget) {
  if (widget is RichText) {
    return widget.text.toPlainText();
  }
  return null;
}
