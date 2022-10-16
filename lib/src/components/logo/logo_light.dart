import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tag_ui/src/strings/file_paths.dart';

class LogoLightTag extends StatelessWidget {
  const LogoLightTag({
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
      FilePaths.LOGO_LIGHT_PATH_SVG,
      semanticsLabel: 'TAG Logo',
      alignment: alignment,
      height: height,
      width: width,
      color: color,
    );
  }
}
