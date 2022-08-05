import 'package:flutter/material.dart';

import 'tag_breadcrumb_item.dart';

class TagBreadcrumb extends StatelessWidget {
  const TagBreadcrumb({
    Key? key, this.rootItem, 
    required this.paths
    }) : super(key: key);

  final String? rootItem;
  final List<String> paths;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: paths.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          child: const Icon(
            Icons.chevron_right,
            size: 18,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.centerLeft,
          child: TagBreadcrumbItem(
            title: paths[index],
            isLast: paths.length - 1 == index,
            action: () {},
          ),
        );
      },
    );
  }
}
