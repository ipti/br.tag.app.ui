import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tag_ui/components/label/tag_label.dart';
import 'package:tag_ui/components/shared/field_constraints.dart';
import 'package:tag_ui/components/shared/tag_input_decoration.dart';

class TagDropdownField<T> extends StatefulWidget {
  TagDropdownField({
    Key? key,
    this.hint,
    this.controller,
    this.inputType,
    this.obscureText,
    this.maxLength,
    this.formatters,
    this.validator,
    required this.onChanged,
    this.onEditingComplete,
    required this.label,
    this.items,
    this.value,
  }) : super(key: key);

  final String? hint;
  final Map<T, String>? items;
  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final int? maxLength;
  final T? value;
  final List<TextInputFormatter>? formatters;
  final Function? validator;
  final Function onChanged;
  final Function? onEditingComplete;

  @override
  _TagDropdownFieldState createState() => _TagDropdownFieldState<T>();
}

class _TagDropdownFieldState<T> extends State<TagDropdownField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var items = widget.items!
        .map((key, value) {
          return MapEntry(
            key,
            DropdownMenuItem<T>(
              child: Text(value),
              value: key,
            ),
          );
        })
        .values
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: TagLabel(widget.label),
        ),
        Container(
          constraints: fieldBoxConstraints,
          child: DropdownButtonFormField<T>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isExpanded: true,
            isDense: false,
            value: widget.value,
            items: items,
            style: textStyle,
            decoration: buildInputDecoration(widget.hint),
            validator: (dynamic value) => widget.validator != null
                ? widget.validator!(value?.toString() ?? "")
                : null,
            onChanged: (T? value) => widget.onChanged(value),
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          ),
        ),
      ],
    );
  }
}
