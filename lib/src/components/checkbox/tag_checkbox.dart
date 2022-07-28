import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagCheckbox extends StatefulWidget {
  /// Checkbox Widget
  ///
  /// is requeired use [label] and the event of change [onChanged]

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

  /// Texto ao lado do checkbox
  final String label;

  @override
  State<TagCheckbox> createState() => _TagCheckboxState();
}

class _TagCheckboxState extends State<TagCheckbox> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.value ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        if (!widget.disabled) widget.onChanged(_value);
      },
      child: Row(
        children: [
          Checkbox(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value!;
              });
            },
          ),
          Expanded(
            child: TagLabel(widget.label),
          ),
        ],
      ),
    );
  }
}
