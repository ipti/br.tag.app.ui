import 'package:flutter/material.dart';
import 'package:tag_ui/tag_ui.dart';

class TagEmpty extends StatelessWidget {
  const TagEmpty({
    super.key,
    this.onPressedRetry,
  });

  final void Function()? onPressedRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 128),
        child: Column(
          children: [
            Heading(text: "Essa lista está vazia", type: HeadingType.Title1),
            Text(
              "Você está sem conexão ou nenhum dado foi cadastrado ainda",
              textAlign: TextAlign.center,
            ),
            if (onPressedRetry != null)
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child:
                    TagButton(text: "Recarregar", onPressed: onPressedRetry!),
              )
          ],
        ),
      ),
    );
  }
}
