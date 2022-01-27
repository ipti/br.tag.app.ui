import 'package:flutter/material.dart';

import 'package:tag_ui/design_tokens/tokens.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key? key,
    required this.text,
    required this.onPressed,
<<<<<<< HEAD
    this.primary = TagColors.colorBaseProductNormal,
    this.onPrimary = TagColors.colorBaseWhiteNormal,
=======
    this.backgroundColor = TagColors.colorBaseProductNormal,
>>>>>>> main
  }) : super(key: key);

  final String text;
  final Function onPressed;
<<<<<<< HEAD
  final Color primary;
  final Color onPrimary;
=======
  final Color backgroundColor;
>>>>>>> main

  @override
  Widget build(BuildContext context) {
    final elevatedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0,
      padding: TagSpancing.paddingButtonNormal,
      minimumSize: const Size(40, TagSizes.heightButtonNormal),
<<<<<<< HEAD
      primary: primary,
=======
      primary: backgroundColor,
>>>>>>> main
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
        child: Text(
          text,
          style: TextStyle(color: onPrimary),
        ),
        onPressed: onPressed as void Function()?,
        style: elevatedButtonTheme,
      ),
    );
  }
}
