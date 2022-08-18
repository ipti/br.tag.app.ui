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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Form(
        key: formkey,
        child: Column(
          children: [
            TagDropdownField<String>(
              onChanged: () {},
              label: "Textinho",
              items: const {
                'chave1': 'valor1',
                'chave2': 'valor2',
                'chave3': 'valor3'
              },
              validator: (String? value) {
                return value == "" ? "Erro" : null;
              },
              hint: "textinho hint",
            ),
            ElevatedButton(
                onPressed: () => formkey.currentState!.validate(),
                child: Text("fsadsafds"))
          ],
        ),
      )
          //TagNumberField(onChanged: (value){},),
          // TagTextField(
          //   label: "Tesxtinho",
          //   controller: TextEditingController(),
          //   validator: (value) =>
          //       (value?.isEmpty ?? true) ? "Por favor retorne um valor" : null,
          //   formatters: const [],
          // ),
          ),
    );
  }
}
