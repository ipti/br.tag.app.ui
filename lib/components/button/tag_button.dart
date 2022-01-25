import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:tag_ui/design_tokens/tokens.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = TagColors.colorBaseProductNormal,
    this.buttonStyle,
    this.icon,
    this.textStyle,
  }) : super(key: key);

  final Function() onPressed;
  final String text;
  final String? icon;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
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

    return Flexible(
      child: icon == null
          ? ElevatedButton(
              child: Text(text),
              onPressed: onPressed,
              style: buttonStyle ?? elevatedButtonTheme,
            )
          : ElevatedButton.icon(
              style: buttonStyle ?? elevatedButtonTheme,
              onPressed: onPressed,
              icon: SvgPicture.asset(
                icon!,
              ),
              label: Text(
                text,
                style: textStyle ??
                    const TextStyle(
                      color: TagColors.colorBaseInkNormal,
                    ),
              ),
            ),
    );
  }
}
