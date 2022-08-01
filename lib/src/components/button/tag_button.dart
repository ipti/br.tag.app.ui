import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.buttonStyle,
    this.icon,
    this.textStyle,
    this.textButtonColor,
  }) : super(key: key);

  final Function() onPressed;
  final String text;
  final String? icon;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textButtonColor;

  @override
  Widget build(BuildContext context) {
    var defaultButtonStyle = buttonStyle ?? TagButtonStyles.primary;
    var defaultTextStyle = textStyle ?? TagTextStyles.textButtonPrimary;

    if (backgroundColor != null) {
      defaultButtonStyle = defaultButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      );
    }

    if (textButtonColor != null) {
      defaultTextStyle = defaultTextStyle.copyWith(color: textButtonColor);
    }

    final buttonText = _ButtonText(
      text: text,
      defaultTextStyle: defaultTextStyle,
      onPressed: onPressed,
      defaultButtonStyle: defaultButtonStyle,
    );

    final buttonIcon = _ButtonIconText(
      defaultButtonStyle: defaultButtonStyle,
      onPressed: onPressed,
      icon: icon,
      text: text,
      defaultTextStyle: defaultTextStyle,
    );

    final buttonRendered = icon == null ? buttonText : buttonIcon;

    return Container(child: buttonRendered);
  }
}

class _ButtonText extends StatelessWidget {
  const _ButtonText({
    Key? key,
    required this.text,
    required this.defaultTextStyle,
    required this.onPressed,
    required this.defaultButtonStyle,
  }) : super(key: key);

  final String text;
  final TextStyle defaultTextStyle;
  final Function() onPressed;
  final ButtonStyle defaultButtonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text, style: defaultTextStyle),
      onPressed: onPressed,
      style: defaultButtonStyle,
    );
  }
}

class _ButtonIconText extends StatelessWidget {
  const _ButtonIconText({
    Key? key,
    required this.defaultButtonStyle,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.defaultTextStyle,
  }) : super(key: key);

  final ButtonStyle defaultButtonStyle;
  final Function() onPressed;
  final String? icon;
  final String text;
  final TextStyle defaultTextStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: defaultButtonStyle,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon!,
      ),
      label: Text(text, style: defaultTextStyle),
    );
  }
}
