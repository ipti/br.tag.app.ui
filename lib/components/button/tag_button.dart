import 'package:flutter/material.dart';

import 'package:tag_ui/design_tokens/tokens.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = TagColors.colorBaseProductNormal,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final elevatedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0,
      padding: TagSpancing.paddingButtonNormal,
      minimumSize: const Size(40, TagSizes.heightButtonNormal),
      primary: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            TagBorderRadiusValues.borderRadiusNormal,
          ),
        ),
      ),
    );

    return Container(
      child: ElevatedButton(
        child: Text(text),
        onPressed: onPressed as void Function()?,
        style: elevatedButtonTheme,
      ),
    );
  }
}
