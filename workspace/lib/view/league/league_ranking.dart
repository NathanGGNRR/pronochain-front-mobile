import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/league/league_matchs.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/frame.dart';
import 'package:pronochain/view/widget/horizontale_line_text.dart';

class LeagueRanking extends StatelessWidget {
  const LeagueRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<- Creates a widget that displays an image.
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
            const Title(),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Classement(),
            ),
            const BottomButton()
          ],
        )));
  }
}

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Ligue FuzSiiiON', style: TextStylePronochain.poppinsBold45),
        HorizontalLineText(
          label: "by FuzSiiiON",
          height: 1,
        ),
      ],
    );
  }
}

class Classement extends StatelessWidget {
  const Classement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listPerson = [
      {"name": "NathanGagn", "placement": "1", "point": "300"},
      {"name": "Shalk_Schark", "placement": "2", "point": "200"},
      {"name": "FuzSiiiON", "placement": "3", "point": "100"}
    ];

    return Frame(
        topChild: const Text(
          'Classement',
          style: TextStylePronochain.dosisRegular22,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            for (var person in listPerson)
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(person['placement'].toString(),
                        style: const TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        person['name'].toString(),
                        style: const TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(person['point'].toString() + ' points',
                        style: const TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15)),
                  )
                ],
              )
          ]),
        ));
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 149,
                height: 55,
                decoration: BoxDecoration(
                    color: ColorStylePronochain.blue,
                    borderRadius: BorderRadius.circular(6)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueRanking()),
                        (route) => false);
                  },
                  child: const Text('Classement',
                      style: TextStyle(
                          color: ColorStylePronochain.backgroundColor,
                          fontFamily: PoliceStylePronochain.dosisRegular,
                          fontSize: 30)),
                  style: TextButton.styleFrom(
                      primary: ColorStylePronochain.backgroundColor),
                )),
            Container(
                width: 149,
                height: 55,
                decoration: BoxDecoration(
                    color: ColorStylePronochain.blue,
                    borderRadius: BorderRadius.circular(6)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueMatchs()),
                        (route) => false);
                  },
                  child: const Text('Matchs',
                      style: TextStyle(
                          color: ColorStylePronochain.backgroundColor,
                          fontFamily: PoliceStylePronochain.dosisRegular,
                          fontSize: 30)),
                  style: TextButton.styleFrom(
                      primary: ColorStylePronochain.backgroundColor),
                )),
          ],
        ),
      )
    ]);
  }
}
