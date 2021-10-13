import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tag_ui/components/label/tag_label.dart';
import 'package:tag_ui/components/shared/field_constraints.dart';
import 'package:tag_ui/components/shared/tag_input_decoration.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

class TagTextField extends StatefulWidget {
  TagTextField({
    Key? key,
    required this.label,
    this.hint,
    this.controller,
    this.inputType,
    this.obscureText,
    this.maxLength,
    this.formatters,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.value,
    this.maxLines,
    this.minLines = 1,
  }) : super(key: key);

  final String? hint;
  final String label;
  final String? value;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final int? maxLength;
  final int? maxLines;
  final int minLines;
  final List<TextInputFormatter>? formatters;
  final Function? validator;
  final Function(String)? onChanged;
  final Function? onEditingComplete;

  @override
  _TagTextFieldState createState() => _TagTextFieldState();
}

class _TagTextFieldState extends State<TagTextField> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: TagFontSize.fontSizeInputNormal,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: TagLabel(widget.label),
        ),
        Container(
          constraints: fieldBoxConstraints,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: widget.value ?? "",
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            controller: widget.controller,
            inputFormatters: widget.formatters,
            maxLength: widget.maxLength,
            keyboardType: widget.inputType,
            style: textStyle,
            validator: widget.validator as String? Function(String?)?,
            decoration: buildInputDecoration(widget.hint),
            onChanged: widget.onChanged,
            onEditingComplete: widget.onEditingComplete as void Function()?,
            onTap: widget.onEditingComplete as void Function()?,
          ),
        ),
      ],
    );
  }
}
