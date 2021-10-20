import 'package:flutter/widgets.dart';
import 'package:tag_ui/design_tokens/colors.dart';
import 'package:tag_ui/design_tokens/font_size.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

enum HeadingType {
  DisplayTitle,
  DisplaySubtitle,
  Title1,
  Title2,
  Title3,
  Title4,
  Title5
}

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
    required this.type,
    this.color = TagColors.colorBaseInkNormal,
  }) : super(key: key);

  final String text;
  final HeadingType type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyleDefault = TextStyle(
      color: color,
    );

    TextStyle textStyleDisplayTitle = TextStyle(
      color: color,
      fontSize: TagFontSize.fontSizeHeadingDisplay,
      fontWeight: TagFontWeight.fontWeightHeadingDisplay,
    );

    TextStyle textStyleDisplaySubtitle = TextStyle(
      color: color,
      fontSize: TagFontSize.fontSizeHeadingDisplaySubtitle,
      fontWeight: TagFontWeight.fontWeightHeadingDisplaySubtitle,
    );

    TextStyle textStyleTitle1 = TextStyle(
      color: color,
      fontSize: TagFontSize.fontSizeHeadingTitle1,
      fontWeight: TagFontWeight.fontWeightHeadingTitle1,
    );

    TextStyle textStyleTitle2 = TextStyle(
      color: TagColors.colorBaseCloudLightActive,
      fontSize: TagFontSize.fontSizeHeadingTitle2,
      fontWeight: TagFontWeight.fontWeightHeadingTitle2,
    );
    TextStyle textStyleTitle3 = TextStyle(
      color: color,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
      fontWeight: TagFontWeight.fontWeightHeadingTitle3,
    );
    TextStyle textStyleTitle4 = TextStyle(
      color: color,
      fontSize: TagFontSize.fontSizeHeadingTitle4,
      fontWeight: TagFontWeight.fontWeightHeadingTitle4,
    );
    TextStyle textStyleTitle5 = TextStyle(
      color: color,
      fontSize: TagFontSize.fontSizeHeadingTitle5,
      fontWeight: TagFontWeight.fontWeightHeadingTitle5,
    );

    TextStyle style;

    switch (type) {
      case HeadingType.DisplayTitle:
        style = textStyleDisplayTitle;
        break;
      case HeadingType.DisplaySubtitle:
        style = textStyleDisplaySubtitle;
        break;
      case HeadingType.Title1:
        style = textStyleTitle1;
        break;
      case HeadingType.Title2:
        style = textStyleTitle2;
        break;
      case HeadingType.Title3:
        style = textStyleTitle3;
        break;
      case HeadingType.Title4:
        style = textStyleTitle4;
        break;
      case HeadingType.Title5:
        style = textStyleTitle5;
        break;
      default:
        style = textStyleDefault;
    }

    return Container(
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
