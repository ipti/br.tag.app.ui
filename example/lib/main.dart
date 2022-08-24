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

  // final source = DataTableSource();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainLayoutAdaptativy()
    );
  }
}
//TagDataTable(columns: const [], source: source)
//TagNumberField(onChanged: (value){},),
// TagTextField(
//   label: "Tesxtinho",
//   controller: TextEditingController(),
//   validator: (value) =>
//       (value?.isEmpty ?? true) ? "Por favor retorne um valor" : null,
//   formatters: const [],
// ),
// TagDropdownField<String>(
//     onChanged: (value) {},
//     label: "Textinho",
//     items: const {
//       'chave1': 'valor1',
//       'chave2': 'valor2',
//       'chave3': 'valor3'
//     },
//     validator: (String? value) {
//       return value == "" ? "Erro" : null;
//     },
//     hint: "textinho hint",
//   ),
//   ElevatedButton(
//       onPressed: () => formkey.currentState!.validate(),
//       child: const Text("fsadsafds"))
// TagDatePickerField(
//               onChanged: (value) {
//                 setState(() {});
//               },
//               controller: controller,
//               label: "Textinho",
//               inputType: TextInputType.datetime,
//             ),
//             Text(
//               controller.text,
//               style: const TextStyle(color: Colors.black),
//             )
// TagAppBar(
//               title: Text("titulo"),
//               leading: TagAppBarMenuIconButton(),
//             ),
//             TagMenu(
//               items: [],
//             ),
//             TagBox(
//               child: Text("Texto"),
//             ),
// TagTextField(
//               label: "Tesxtinho",
//               formatters: [TagMasks.maskCPF],
// ),
