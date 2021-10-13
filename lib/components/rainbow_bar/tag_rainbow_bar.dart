import 'package:flutter/widgets.dart';

class TagRainbowBar extends StatelessWidget {
  const TagRainbowBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Flexible(
              child: Container(
                height: 4,
                color: const Color(0xFF667DF4),
              ),
            ),
            Flexible(
              child: Container(
                height: 4,
                color: const Color(0xFFF45A5A),
              ),
            ),
            Flexible(
              child: Container(
                height: 4,
                color: const Color(0xFF66D654),
              ),
            ),
            Flexible(
              child: Container(
                height: 4,
                color: const Color(0xFFEADA48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
