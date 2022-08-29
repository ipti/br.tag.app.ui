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

  get tabController => null;

  @override
  void initState() {
    controller.addListener(() {
      log(controller.text);
    });
    super.initState();
  }

  //   @override
  // void initState() {
  //   super.initState();
  //    TabController _tabController = TabController(
  //     length: 2,
  //     vsync: this
  //   );
  // }
  //  @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: TagScaffold(
          title: "titulo",
          path: const ["menu", "mangás"],
          description: "descrição",
          menu: Container(
            key: const Key("menu"),
          ),
          tabBar: const TabBar(tabs: [
            Tab(
              child: Icon(Icons.menu),
              icon: Icon(Icons.menu),
            ),
            Tab(
              child: Icon(Icons.menu),
              icon: Icon(Icons.add_comment),
            )
          ]),
          actionsHeader: QualquerNome(),
          aside: Container(
            key: const Key("aside"),
            //tabBar:  TabBar(controller: _tabController,  tabs: const <Widget>[Tab(icon: Icon(Icons.access_alarm),), Tab(icon: Icon(Icons.add_comment),)]),
          ),
          body: TabBarView(children: [
            Container(
              color: Colors.red,
              key: const Key("Body"),
              child: const Text("data"),
            ),
            Container(
              color: Colors.blue,
              key: const Key("Body1"),
              child: const Text("nome"),
            ),
          ]),
        ),
      ),
    );
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
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
