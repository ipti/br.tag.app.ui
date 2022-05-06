import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/tag_ui.dart';

// ignore: must_be_immutable
class TagIcon extends StatefulWidget {
  TagIcon({
    Key? key,
    required this.defaultVersionPath,
    required this.disabledVersionPath,
    this.disabled = false,
  }) : super(key: key);

  final String defaultVersionPath;
  final String disabledVersionPath;
  bool disabled;

  @override
  _TagIconState createState() => _TagIconState();
}

class _TagIconState extends State<TagIcon> {
  @override
  Widget build(BuildContext context) {
    final path = widget.disabled
        ? widget.disabledVersionPath
        : widget.defaultVersionPath;
    return Container(
      constraints: BoxConstraints(
        maxHeight: TagSizes.heightIconLarge,
        maxWidth: TagSizes.widthIconLarge,
        minHeight: TagSizes.heightIconSmall,
        minWidth: TagSizes.widthIconSmall,
      ),
      child: SvgPicture.asset(
        path,
      ),
    );
  }
}
