import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagCheckbox extends StatelessWidget {
  const TagCheckbox({
    Key? key,
    required this.onChanged,
    this.value = false,
    this.disabled = false,
    required this.label,
  }) : super(key: key);

  final void Function(bool? isChecked) onChanged;
  final bool? value;
  final bool disabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value ?? false,
          onChanged: disabled ? null : onChanged,
        ),
        Expanded(
          child: TagLabel(label),
        ),
      ],
    );
  }
}
