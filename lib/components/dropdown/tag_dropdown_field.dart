import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tag_ui/components/label/tag_label.dart';
import 'package:tag_ui/components/shared/field_constraints.dart';
import 'package:tag_ui/components/shared/tag_input_decoration.dart';

class TagDropdownField extends StatefulWidget {
  TagDropdownField({
    Key? key,
    this.hint,
    this.controller,
    this.inputType,
    this.obscureText,
    this.maxLength,
    this.formatters,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    required this.label,
    this.items,
    this.value,
  }) : super(key: key);

  final String? hint;
  final Map<int, String>? items;
  final String label;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final int? maxLength;
  final int? value;
  final List<TextInputFormatter>? formatters;
  final Function? validator;
  final Function? onChanged;
  final Function? onEditingComplete;

  @override
  _TagDropdownFieldState createState() => _TagDropdownFieldState();
}

class _TagDropdownFieldState extends State<TagDropdownField> {
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
    final dropdownItens = widget.items!
        .map((key, value) {
          return MapEntry(
            key,
            DropdownMenuItem<int>(
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
          child: DropdownButtonFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isExpanded: true,
            isDense: false,
            value: widget.value,
            items: dropdownItens,
            style: textStyle,
            decoration: buildInputDecoration(widget.hint),
            validator: (dynamic value) => widget.validator != null
                ? widget.validator!(value?.toString() ?? "")
                : null,
            onChanged: widget.onChanged as void Function(int?)?,
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          ),
        ),
      ],
    );
  }
}
