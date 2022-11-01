import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';

class Odds extends StatelessWidget {
  final String label;
  final double odds;

  const Odds({required this.label, required this.odds, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.00),
          color: ColorStylePronochain.yellow,
        ),
        child: Column(children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.only(left: 10, bottom: 0, right: 10, top: 5),
              child: Text(label,
                  style: const TextStyle(
                      fontFamily: PoliceStylePronochain.dosisRegular,
                      fontSize: 20))),
          Text(odds.toString(),
              style: const TextStyle(
                  fontFamily: PoliceStylePronochain.dosisRegular, fontSize: 15))
        ]));
  }
}
