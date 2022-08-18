import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tag_ui/src/components/shared/field_constraints.dart';
import 'package:tag_ui/src/components/shared/tag_input_decoration.dart';

import 'package:tag_ui/tag_ui.dart';

class TagDropdownField<T> extends StatefulWidget {
  TagDropdownField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.items,
    this.hint,
    this.value,
    this.padding = TagSpancing.paddingTextField,
    this.validator,
    this.controller,
    // TODO: Remover campos não utilizados
    this.inputType,
    // TODO: Remover campos não utilizados
    this.obscureText,
    // TODO: Remover campos não utilizados
    this.maxLength,
    // TODO: Remover campos não utilizados
    this.formatters,
    // TODO: Remover campos não utilizados
    this.onEditingComplete,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    // TODO: Remover campos não utilizados
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
  final EdgeInsets padding;
  final AutovalidateMode autovalidateMode;

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
            child: DropdownButtonFormField<T>(
              key: widget.key,
              autovalidateMode: widget.autovalidateMode,
              isExpanded: true,
              isDense: false,
              value: widget.value,
              items: items,
              itemHeight: TagSizes.heightInputLarge,
              alignment: Alignment.centerLeft,
              style: TagTextStyles.textFieldStyle,
              decoration: buildInputDecoration(widget.hint),
              validator: (dynamic value) => widget.validator != null
                  ? widget.validator!(value?.toString() ?? "")
                  : null,
              onChanged: (T? value) => widget.onChanged(value),
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            ),
          ),
        ],
      ),
    );
  }
}
