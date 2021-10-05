import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tag_ui/components/components.dart';
import 'package:tag_ui/components/logo/logo.dart';
import 'package:tag_ui/design_tokens/tokens.dart';

import 'i_tag_menu_item.dart';

class TagMenu extends StatelessWidget {
  const TagMenu({
    Key? key,
    required this.items,
    this.initialRoute,
  }) : super(key: key);

  final String? initialRoute;
  final List<ITagMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: TagColors.colorBaseProductLight,
      ),
      child: Drawer(
        elevation: 0,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  ),
                ),
                child: const LogoTag(
                  width: 64,
                ),
              ),
              ...items
            ],
          ),
        ),
      ),
    );
  }
}
