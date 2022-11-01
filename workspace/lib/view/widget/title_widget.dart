import 'package:flutter/material.dart';
import '/text_style.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;

  const TitleWidget(
      {Key? key,
      required this.text,
      this.textStyle = TextStylePronochain.poppinsExtraBold46,
      this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child:
                    Text(text, textAlign: TextAlign.center, style: textStyle))
          ],
        )
      ]),
    );
  }
}
