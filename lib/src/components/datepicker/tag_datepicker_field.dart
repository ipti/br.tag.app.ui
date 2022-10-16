import 'package:flutter/material.dart';

import 'package:tag_ui/tag_ui.dart';

import '../shared/field_constraints.dart';
import '../shared/tag_input_decoration.dart';

class TagDatePickerField extends StatefulWidget {
  TagDatePickerField({
    super.key,
    required this.onChanged,
    required this.label,
    this.hint,
    this.controller,
    this.inputType,
    this.validator,
    this.onEditingComplete,
    this.value,
    this.padding = TagSpancing.paddingTextField,
  });

  final String? hint;
  final String label;
  final String? value;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Function? validator;
  final void Function(String) onChanged;
  final Function? onEditingComplete;
  final EdgeInsets padding;

  @override
  _TagDatePickerFieldState createState() => _TagDatePickerFieldState();
}

class _TagDatePickerFieldState extends State<TagDatePickerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: TagLabel(widget.label),
          ),
          Container(
            constraints: fieldBoxConstraints,
            child: TextFormField(
              key: widget.key,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              initialValue: widget.value,
              controller: widget.controller,
              inputFormatters: [
                TagMasks.maskDate,
              ],
              keyboardType: widget.inputType,
              style: TagTextStyles.textFieldStyle,
              validator: widget.validator as String? Function(String?)?,
              decoration: buildInputDecoration(widget.hint),
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete as void Function()?,
              onTap: widget.onEditingComplete as void Function()?,
            ),
          ),
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101),);
  //   if (picked != null && picked != selectedDate)
  //     widget.controller.text = picked.toString();
  // }
}
