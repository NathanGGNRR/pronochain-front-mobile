import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/league/league_ranking.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/but.dart';
import 'package:pronochain/view/widget/frame.dart';
import 'package:pronochain/view/widget/horizontale_line_text.dart';

class LeagueMatchs extends StatelessWidget {
  const LeagueMatchs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listMatch = [
      {
        "TeamA": "NathanGagn",
        "TeamB": "Shalk_Schark",
        "StartDate": "10 Feb 2022",
        "But": [
          {
            "TeamA": ["34", "37", "49"]
          },
          {
            "TeamB": ["24"]
          }
        ]
      },
      {
        "TeamA": "NathanGagn",
        "TeamB": "Shalk_Schark",
        "StartDate": "10 Feb 2022",
        "But": [
          {
            "TeamA": ["70", "81"]
          },
          {
            "TeamB": ["2"]
          }
        ]
      },
      {
        "TeamA": "NathanGagn",
        "TeamB": "Shalk_Schark",
        "StartDate": "10 Feb 2022",
        "But": [
          {
            "TeamA": ["36"]
          },
          {
            "TeamB": ["66"]
          }
        ]
      },
    ];

    //<- Creates a widget that displays an image.
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(margin: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
            const Title(),
            for (var match in listMatch) Matchs(match: match),
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

class Matchs extends StatelessWidget {
  final dynamic match;

  const Matchs({required this.match, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String butTeamA = "";
    if (match['But'][0]['TeamA'].isNotEmpty == false) {
      butTeamA = "0";
    } else {
      butTeamA = match['But'][0]['TeamA'].length.toString();
    }

    return Frame(
        topChild: const Text(
          'test',
          style: TextStylePronochain.dosisRegular22,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      match['TeamA'].toString() +
                          " " +
                          butTeamA +
                          " - " +
                          match['But'][1]['TeamB'].length.toString() +
                          " " +
                          match['TeamB'].toString(),
                      style: const TextStyle(
                          color: ColorStylePronochain.white,
                          fontFamily: PoliceStylePronochain.dosisLight,
                          fontSize: 15))
                ],
              ),
              But(
                // listButTeamA: items,
                listButTeamA: match['But'][0]['TeamA'],
                listButTeamB: match['But'][1]['TeamB'],
              )
            ],
          ),
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
                    color: ColorStylePronochain.pink,
                    borderRadius: BorderRadius.circular(6)),
                child: TextButton(
                  onPressed: () {},
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
