import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagDefaultPage extends StatelessWidget {
  final String title;
  final List<String> path;
  final String description;
  final List<Widget> body;
  final Widget menu;
  final Widget? aside;
  final Widget? header;

  const TagDefaultPage({
    Key? key,
    required this.title,
    required this.path,
    required this.description,
    required this.body,
    required this.menu,
    this.aside,
    this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainLayoutAdaptativy(
        left: menu,
        body: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  header ?? Container(),
                  SizedBox(
                    height: 50,
                    child: TagBreadcrumb(
                      rootItem: "Tag",
                      paths: path,
                    ),
                  ),
                  Heading(
                    text: title,
                    type: HeadingType.Title1,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: TagColors.colorBaseInkLight,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  ...body
                ],
              ),
            ),
          ),
        ),
        right: aside,
      ),
    );
  }
}
