import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: TagTextField(label: "Tesxtinho",  controller: TextEditingController(),),
      ),
    );
  }
}
