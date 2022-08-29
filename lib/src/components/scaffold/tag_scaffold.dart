import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagScaffold extends StatelessWidget {
  final String title;
  final List<String> path;
  final String description;
  final Widget body;
  final Widget menu;
  final Widget? aside;
  final Widget? header;
  //não utilizado
  final SliverPersistentHeaderDelegate? actionsHeader;

  final TabBar? tabBar;

  const TagScaffold({
    Key? key,
    required this.title,
    required this.path,
    required this.description,
    required this.body,
    required this.menu,
    this.aside,
    this.header,
    this.tabBar,
    this.actionsHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainLayoutAdaptativy(
        left: menu,
        body: Align(
          alignment: Alignment.topLeft,
          child: LayoutBuilder(builder: (context, contraints) {
            final isDesktop = MediaQuery.of(context).size.width > 992;
            return NestedScrollView(
              body: body,
              physics: ScrollPhysics(
                  parent: isDesktop
                      ? PageScrollPhysics()
                      : AlwaysScrollableScrollPhysics()),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverPersistentHeader(
                  delegate: _SliverHeaderBreadcrumbDelegate(
                    path: path,
                  ),
                  pinned: isDesktop,
                ),
                SliverPersistentHeader(
                  delegate: _SliverHeaderDelegate(
                    title: title,
                  ),
                  pinned: true,
                ),
                if (tabBar is TabBar)
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(tabBar!),
                    pinned: true,
                  ),
                if (actionsHeader is SliverPersistentHeaderDelegate)
                  SliverPersistentHeader(
                    delegate: actionsHeader!,
                    pinned: true,
                  ),
              ],
            );
          }),
        ),
        right: aside,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: TagColors.colorBaseWhiteNormal,
      child: _tabBar,
    );
  }

  // coverage:ignore-start
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) =>
      false; // coverage:ignore-line
  // coverage:ignore-end
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({
    required this.title,
  });

  final String title;

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 40;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              child: Heading(
            text: title,
            type: HeadingType.Title1,
          )),
        ],
      ),
    );
  }

  @override
  // coverage:ignore-line
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return false;
  }
}

class _SliverHeaderBreadcrumbDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderBreadcrumbDelegate({
    required this.path,
  });

  final List<String> path;

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: TagColors.colorBaseWhiteNormal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TagBreadcrumb(
        rootItem: "Tag",
        paths: path,
      ),
    );
  }

  @override
  // coverage:ignore-line
  bool shouldRebuild(_SliverHeaderBreadcrumbDelegate oldDelegate) => false;
}
