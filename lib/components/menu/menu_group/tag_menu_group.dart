import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tag_ui/components/menu/menu_item/tag_menu_item.dart';
import 'package:tag_ui/design_tokens/colors.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

import '../i_tag_menu_item.dart';

class TagMenuGroup extends StatelessWidget implements ITagMenuItem {
  const TagMenuGroup({
    Key? key,
    required this.title,
    required this.submenus,
    this.icon,
    this.routeActiveItem = "/",
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final Widget? icon;
  final bool isActive;
  final String routeActiveItem;
  final List<TagMenuItem> submenus;

  @override
  Widget build(BuildContext context) {
    final textColor = isActive
        ? TagColors.colorBaseProductDark
        : TagColors.colorBaseProductNormal;

    final indicatorColor =
        isActive ? TagColors.colorBaseProductDark : Colors.transparent;

    final textStyle = TextStyle(
      color: textColor,
      fontSize: TagFontSize.fontSizeHeadingTitle3,
      fontWeight: FontWeight.w500,
    );

    return Stack(
      children: [
        Container(
          height: 48,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 24,
              width: 4,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(8)),
                color: indicatorColor,
              ),
            ),
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: isActive,
            iconColor: Colors.transparent,
            collapsedIconColor: Colors.transparent,
            leading: icon,
            title: Text(
              title,
              style: textStyle,
            ),
            children: [
              // for (var i = 0; i < submenus.length; i++)
              //   submenus[i].copyWith(
              //     isActive: routeActiveItem == submenus[i].route,
              //   )
            ],
            childrenPadding: const EdgeInsets.only(left: 16),
          ),
        ),
      ],
    );
  }

  copyWith({
    String? title,
    Widget? icon,
    bool? isActive,
    String? routeActiveItem,
    int? menuGroupId,
    List<TagMenuItem>? submenus,
  }) {
    return TagMenuGroup(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      submenus: submenus ?? this.submenus,
      isActive: isActive ?? this.isActive,
      routeActiveItem: routeActiveItem ?? this.routeActiveItem,
    );
  }
}
