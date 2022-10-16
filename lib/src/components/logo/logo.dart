import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/src/strings/file_paths.dart';

class TagLogo extends StatelessWidget {
  const TagLogo({
    super.key,
    this.color,
    this.width,
    this.height,
    this.alignment = Alignment.centerLeft,
  });

  final Color? color;
  final double? width;
  final double? height;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      FilePaths.LOGO_PATH_SVG,
      semanticsLabel: 'TAG Logo',
      alignment: alignment,
      height: height,
      width: width,
      color: color,
      package: 'tag_ui',
    );
  }
}
