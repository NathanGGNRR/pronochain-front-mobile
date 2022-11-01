import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';

class But extends StatefulWidget {
  final List<String>? listButTeamA;
  final List<String>? listButTeamB;

  const But({Key? key, this.listButTeamA, this.listButTeamB}) : super(key: key);

  @override
  _AppButState createState() => _AppButState();
}

class _AppButState extends State<But> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            for (var butA in widget.listButTeamA!)
              SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: const Icon(
                          Icons.sports_soccer,
                          color: ColorStylePronochain.white,
                        ),
                      ),
                      Text(
                        butA + " min",
                        style: TextStylePronochain.dosisLight15,
                      ),
                    ],
                  ))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var butB in widget.listButTeamB!)
              SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: const Icon(
                        Icons.sports_soccer,
                        color: ColorStylePronochain.white,
                      ),
                    ),
                    Text(
                      butB + " min",
                      style: TextStylePronochain.dosisLight15,
                    ),
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
