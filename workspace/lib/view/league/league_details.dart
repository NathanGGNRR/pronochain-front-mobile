import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/league/league_matchs.dart';
import 'package:pronochain/view/league/league_ranking.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/but.dart';
import 'package:pronochain/view/widget/frame.dart';
import 'package:pronochain/view/widget/horizontale_line_text.dart';

class LeagueDetails extends StatelessWidget {
  const LeagueDetails({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(top: 12, left: 4, right: 4),
              child: LeagueInfo(),
            ),
            const SizedBox(height: 155, child: DernMatchEncours()),
            const Classement(),
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

class LeagueInfo extends StatelessWidget {
  const LeagueInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: const [
                  Icon(
                    Icons.lock_sharp,
                    color: ColorStylePronochain.white,
                    size: 23,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Private',
                        style: TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: const [
                  Icon(
                    Icons.access_time_sharp,
                    color: ColorStylePronochain.white,
                    size: 23,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        '12 Janv. 22',
                        style: TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Icon(
                      Icons.perm_device_info,
                      color: ColorStylePronochain.white,
                      size: 23,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          'Libre',
                          style: TextStyle(
                              color: ColorStylePronochain.white,
                              fontFamily: PoliceStylePronochain.dosisLight,
                              fontSize: 15),
                        ))
                  ],
                )),
          ],
        ),
        Column(
          children: [
            Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: ColorStylePronochain.yellow,
                    width: 2,
                  )),
              child: ClipRRect(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(6),
                  child: Image.asset(
                    'images/pp.png',
                    fit: BoxFit.cover,
                  ),
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: ColorStylePronochain.white,
                    size: 23,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        '41/100',
                        style: TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: const [
                  Icon(
                    Icons.access_time_sharp,
                    color: ColorStylePronochain.white,
                    size: 23,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        '12 Janv. 22',
                        style: TextStyle(
                            color: ColorStylePronochain.white,
                            fontFamily: PoliceStylePronochain.dosisLight,
                            fontSize: 15),
                      ))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: const [
                    Icon(
                      Icons.perm_device_info,
                      color: ColorStylePronochain.white,
                      size: 23,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          'Libre',
                          style: TextStyle(
                              color: ColorStylePronochain.white,
                              fontFamily: PoliceStylePronochain.dosisLight,
                              fontSize: 15),
                        ))
                  ],
                )),
          ],
        ),
      ],
    );
  }
}

class DernMatchEncours extends StatelessWidget {
  const DernMatchEncours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "8",
      "43",
      "51",
      "66",
      "73",
      "89",
      "105",
    ];

    List<String> newItems = [];

    for (int i = 0; i < 3; i++) {
      newItems.add(items[i]);
    }

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        for (int i = 0; i < 5; i++)
          Frame(
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
                      children: const [
                        Text('NathanGagn' + ' 2 - 1' + ' FuzSiiiON',
                            style: TextStyle(
                                color: ColorStylePronochain.white,
                                fontFamily: PoliceStylePronochain.dosisLight,
                                fontSize: 15))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: But(
                                listButTeamA: newItems, listButTeamB: newItems))
                      ],
                    )
                  ],
                ),
              ))
      ],
    );
  }
}

class Classement extends StatelessWidget {
  const Classement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "NathanGagn",
      "Shalk_Shark",
      "FuzSiiiON",
    ];

    return Frame(
        topChild: const Text(
          'Classement',
          style: TextStylePronochain.dosisRegular22,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            for (var item in items)
              Text(
                item,
                style: const TextStyle(
                    color: ColorStylePronochain.white,
                    fontFamily: PoliceStylePronochain.dosisLight,
                    fontSize: 15),
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
                    color: ColorStylePronochain.pink,
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
