import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagAppBar extends StatelessWidget implements PreferredSize {
  const TagAppBar({
    super.key,
    this.title = const TagLogo(alignment: Alignment.centerLeft),
    this.leading = const TagAppBarMenuIconButton(),
  });

  final Widget title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    const iconTheme = const IconThemeData(
      color: TagColors.colorBaseProductDark,
      size: 24,
    );

    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: TagColors.colorBaseWhiteNormal,
      centerTitle: true,
      elevation: 0,
      iconTheme: iconTheme,
      leading: leading,
      title: TagAppbarTitle(title: title),
      toolbarHeight: TagSizes.heightServiceLogoMedium + 28,
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize =>
      Size.fromHeight(TagSizes.heightServiceLogoMedium + 28);
}

class TagAppBarMenuIconButton extends StatelessWidget {
  const TagAppBarMenuIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.menu,
        size: 24.0,
      ),
      onPressed: () => Scaffold.of(context).openDrawer(),
    );
  }
}

class TagAppBarBackIconButton extends StatelessWidget {
  const TagAppBarBackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 24.0,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}

class TagAppbarTitle extends StatelessWidget {
  const TagAppbarTitle({
    super.key,
    required this.title,
  });

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      margin: EdgeInsets.all(14),
      height: TagSizes.heightServiceLogoMedium,
      child: Center(
        child: title,
      ),
    );
  }
}
