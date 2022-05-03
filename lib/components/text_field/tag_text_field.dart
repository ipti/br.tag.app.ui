import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tag_ui/components/label/tag_label.dart';
import 'package:tag_ui/components/shared/field_constraints.dart';
import 'package:tag_ui/components/shared/tag_input_decoration.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

class TagTextField extends StatefulWidget {
  const TagTextField({
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
    this.maxLines = 1,
    this.minLines = 1,
    this.padding = TagSpancing.paddingTextField,
  }) : super(key: key);

  final String? hint;
  final String label;
  final String? value;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? obscureText;
  final int? maxLength;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter>? formatters;
  final Function? validator;
  final Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final EdgeInsets padding;

  @override
  _TagTextFieldState createState() => _TagTextFieldState();
}

class _TagTextFieldState extends State<TagTextField> {
  final _debouncer = Debouncer(delay: Duration(milliseconds: 250));
  void _onValueChanged(String value) {
    if (widget.onChanged != null) {
      _debouncer.call(() => widget.onChanged!(value));
    } else if (widget.onEditingComplete != null) {
      _debouncer.call(() => widget.onEditingComplete!());
    }
  }

  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.value.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: TagFontSize.fontSizeInputNormal,
    );

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
                key: widget.key ?? Key(widget.label),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                controller: _controller,
                obscureText: widget.obscureText ?? false,
                inputFormatters: widget.formatters,
                maxLength: widget.maxLength,
                keyboardType: widget.inputType,
                style: textStyle,
                validator: widget.validator as String? Function(String?)?,
                decoration: buildInputDecoration(widget.hint),
                onChanged: _onValueChanged,
                onEditingComplete: () {
                  _onValueChanged(_controller.text);
                  if (widget.onEditingComplete != null)
                    widget.onEditingComplete!();
                }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}

class Debouncer {
  Debouncer({this.delay = const Duration(milliseconds: 300)});

  final Duration delay;
  Timer? _timer;

  void call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
