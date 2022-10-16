import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

import '../i_tag_menu_item.dart';

enum MenuItemState { Normal, Hover, Click, Disabled }

class TagMenuItem extends StatelessWidget implements ITagMenuItem {
  const TagMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.onTap,
    this.icon,
    this.isActive = false,
    this.menuItemState,
  });

  final String title;
  final String route;
  final TagIcon? icon;
  final bool isActive;
  final void Function(String route) onTap;
  final MenuItemState? menuItemState;

  @override
  Widget build(BuildContext context) {
    final textColor =
        isActive ? TagColors.colorBaseProductDark : TagColors.colorBaseInkLight;

    final textStyle = TextStyle(
      color: textColor,
      fontWeight: TagFontWeight.fontWeightLinks,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
    );
    final indicatorColor =
        isActive ? TagColors.colorBaseProductDark : Colors.transparent;

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 24,
                width: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(8),
                  ),
                  color: indicatorColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                TagBorderRadiusValues.borderRadiusLarge,
              ),
              onTap: () {
                onTap.call(route);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    TagBorderRadiusValues.borderRadiusLarge,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: ConstrainedBox(
                  constraints: constraints,
                  child: Row(
                    children: [
                      if (icon != null) icon!..disabled = !isActive,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            title,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
