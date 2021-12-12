import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

class TagButtonSecondary extends StatelessWidget {
  const TagButtonSecondary(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final elevatedButtonTheme = ElevatedButton.styleFrom(
      elevation: 0,
      textStyle: TextStyle(color: TagColors.colorBaseInkNormal),
      padding: TagSpancing.paddingButtonNormal,
      minimumSize: const Size(40, TagSizes.heightButtonNormal),
      primary: TagColors.colorBaseCloudNormal,
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
          style: TextStyle(color: TagColors.colorBaseInkNormal),
        ),
        onPressed: onPressed,
        style: elevatedButtonTheme,
      ),
    );
  }
}
