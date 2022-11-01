import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';

class HorizontalLineText extends StatelessWidget {
  final String label;
  final double height;

  const HorizontalLineText({this.label = "",required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double marginBottom = label == "" ? 5.0 : 0.0;
    List<Widget> rowChilds = <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15, right: 4),
            child: Divider(
              color: ColorStylePronochain.yellow,
              height: height,
            )),
      )
    ];

    if (label != "") {
      rowChilds.add(Text(
        label,
        style: const TextStyle(
            color: ColorStylePronochain.yellow,
            fontFamily: PoliceStylePronochain.dosisLight,
            fontSize: 15),
      ));
      rowChilds.add(Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 4, right: 15),
            child: Divider(
              color: ColorStylePronochain.yellow,
              height: height,
            )),
      ));
    }
    return Row(children: rowChilds);
  }
}
