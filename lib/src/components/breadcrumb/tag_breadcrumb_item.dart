import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagBreadcrumbItem extends StatefulWidget {
  const TagBreadcrumbItem({
    Key? key,
    required this.title,
    this.action,
    this.isLast = false,
  }) : super(key: key);

  final String title;
  final void Function()? action;
  final bool isLast;

  @override
  _TagBreadcrumbItemState createState() => _TagBreadcrumbItemState();
}

class _TagBreadcrumbItemState extends State<TagBreadcrumbItem> {
  final textStyle = TextStyle(
    fontWeight: TagFontWeight.fontWeightLinks,
    fontSize: TagFontSize.fontSizeTextNormal,
    color: TagColors.colorBaseProductNormal,
  );

  final textStyleHover = TextStyle(
    fontWeight: TagFontWeight.fontWeightLinks,
    fontSize: TagFontSize.fontSizeTextNormal,
    color: TagColors.colorBaseProductNormal,
    decoration: TextDecoration.underline,
  );

  final textStylActive = TextStyle(
    fontWeight: TagFontWeight.fontWeightBold,
    fontSize: TagFontSize.fontSizeTextNormal,
    color: TagColors.colorBaseProductNormal,
  );

  TextStyle? style;

  @override
  void initState() {
    super.initState();
    style = textStyle;
  }

  @override
  Widget build(BuildContext context) {
    final textButton = RichText(
      text: TextSpan(
        recognizer: TapGestureRecognizer()..onTap = widget.action,
        text: widget.title,
        style: widget.isLast ? textStylActive : style,
      ),
    );

    return MouseRegion(
      onHover: (event) {
        setState(() {
          style = textStyleHover;
        });
      },
      onExit: (event) {
        setState(() {
          style = textStyle;
        });
      },
      child: textButton,
    );
  }
}
