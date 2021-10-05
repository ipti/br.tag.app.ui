import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TagMasks {
  static final maskDate = new MaskTextInputFormatter(
    mask: '##\/##\/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static final maskTime = new MaskTextInputFormatter(
    mask: '2#:5#',
    filter: {
      "#": RegExp(r'[0-9]'),
      "5": RegExp(r'[0-5]'),
      "2": RegExp(r'[0-2]'),
    },
  );
}
