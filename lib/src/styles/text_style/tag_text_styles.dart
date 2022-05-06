import 'package:flutter/widgets.dart';
import 'package:tag_ui/tag_ui.dart';

abstract class TagTextStyles {
  static const textFieldStyle = TextStyle(
    fontSize: TagFontSize.fontSizeInputNormal,
    color: TagColors.colorBaseInkNormal,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const textButtonPrimary = TextStyle(
    color: TagColors.colorBaseWhiteNormal,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.2,
  );

  static const textButtonSecondary = TextStyle(
    color: TagColors.colorBaseInkNormal,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.2,
  );

  static const textTableColumnHeader = TextStyle(
    color: TagColors.colorBaseInkNormal,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.2,
  );
}
