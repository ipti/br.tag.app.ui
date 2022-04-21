import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

const borderSide = BorderSide(
  color: TagBorderColor.borderColorInput,
  width: TagBorderStyle.borderWidthInput,
  style: BorderStyle.solid,
);

final border = OutlineInputBorder(
  borderSide: borderSide,
  borderRadius: BorderRadius.circular(
    TagBorderRadiusValues.borderRadiusNormal,
  ),
);

final buildInputDecoration = (String? hint) => InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: hint,
      filled: true,
      fillColor: TagColors.colorBaseWhiteNormal,
      contentPadding: TagSpancing.paddingInputNormal,
      enabledBorder: border.copyWith(
        borderSide: borderSide.copyWith(
          color: TagBorderColor.borderColorInput,
        ),
      ),
      border: border,
    );
