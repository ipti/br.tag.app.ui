import 'package:flutter/material.dart';
import 'package:tag_ui/src/components/shared/field_constraints.dart';
import 'package:tag_ui/src/components/shared/tag_input_decoration.dart';
import 'package:tag_ui/tag_ui.dart';

class TagDropdownField<T> extends StatelessWidget {
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
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  final AutovalidateMode autovalidateMode;
  final TextEditingController? controller;
  final String? hint;
  final Map<T, String> items;
  final String label;
  final FormFieldSetter<T> onChanged;
  final EdgeInsets padding;
  final FormFieldValidator<T>? validator;
  final T? value;

  @override
  Widget build(BuildContext context) {
    final mappedItems = [
      for (var item in items.entries)
        DropdownMenuItem<T>(
          child: Text(item.value),
          value: item.key,
        ),
    ];
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: TagLabel(label),
          ),
          Container(
            constraints: fieldBoxConstraints,
            child: DropdownButtonFormField<T>(
              key: key,
              autovalidateMode: autovalidateMode,
              isExpanded: true,
              isDense: false,
              value: value,
              items: mappedItems,
              itemHeight: TagSizes.heightInputLarge,
              alignment: Alignment.centerLeft,
              style: TagTextStyles.textFieldStyle,
              decoration: buildInputDecoration(hint),
              validator: validator,
              onChanged: onChanged,
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            ),
          ),
        ],
      ),
    );
  }
}
