import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final formkey = GlobalKey<FormState>();

  final controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      log(controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TagScaffold(
      title: "titulo",
      path: const ["menu", "mangás"],
      description: "descrição",
      body: Container(
        key: Key("Body"),
      ),
      menu: Container(
        key: Key("menu"),
      ),
      header: Container(
        key: Key("header"),
      ),
      actionsHeader: QualquerNome(),
    ));
  }
}

class QualquerNome extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.amber,
      height: maxExtent,
      child: const Text("batata"),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
