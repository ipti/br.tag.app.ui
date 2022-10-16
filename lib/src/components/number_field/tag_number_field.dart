import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tag_ui/tag_ui.dart';

class TagNumberField extends StatefulWidget {
  const TagNumberField({
    super.key,
    required this.onChanged,
  });

  final Function onChanged;

  @override
  _TagNumberFieldState createState() => _TagNumberFieldState();
}

class _TagNumberFieldState extends State<TagNumberField> {
  ValueNotifier<int> counter = ValueNotifier(0);
  TextEditingController controller = TextEditingController(text: "0");

  @override
  void initState() {
    super.initState();

    counter.addListener(() {
      controller.text = counter.value.toString();
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
      widget.onChanged(counter.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, maxWidth: 170),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: _NumberFieldButton(
                  icon: Icons.remove,
                  onPressed: () {
                    if (counter.value > 0) counter.value -= 1;
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: _TextNumberField(
                  controller: controller,
                  onChanged: (String value) {
                    if (value.isNotEmpty)
                      counter.value = int.parse(value);
                    else
                      counter.value = 0;
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: _NumberFieldButton(
                  onPressed: () {
                    counter.value += 1;
                  },
                  icon: Icons.add,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _TextNumberField extends StatelessWidget {
  const _TextNumberField({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: false,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      onChanged: onChanged as void Function(String)?,
    );
  }
}

class _NumberFieldButton extends StatelessWidget {
  const _NumberFieldButton({
    required this.onPressed,
    required this.icon,
  });

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 40,
        maxWidth: 40,
        minHeight: 40,
        maxHeight: 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              TagColors.colorBaseProductLight,
            ),
          ),
          onPressed: onPressed as void Function()?,
          child: Icon(
            icon,
            color: TagColors.colorBaseInkNormal,
          ),
        ),
      ),
    );
  }
}
