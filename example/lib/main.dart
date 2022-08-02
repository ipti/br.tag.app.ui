import 'package:flutter/material.dart';
import 'package:tag_ui/src/components/checkbox/tag_checkbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TagCheckbox(
          onChanged: (isChecked) {},
          label: "Testado?",
        ),
      ),
    );
  }
}
