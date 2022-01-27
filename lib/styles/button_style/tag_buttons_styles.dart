import 'package:flutter/material.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

abstract class TagButtonStyles {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    elevation: 0,
    padding: TagSpancing.paddingButtonNormal,
    minimumSize: const Size(40, TagSizes.heightButtonNormal),
    primary: TagColors.colorBaseProductNormal,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          TagBorderRadiusValues.borderRadiusNormal,
        ),
      ),
    ),
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    elevation: 0,
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
}
