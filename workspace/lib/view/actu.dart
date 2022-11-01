import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/frame.dart';

import '../text_style.dart';

class Actu extends StatelessWidget {
  const Actu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(),
        bottomNavigationBar: MyBottomAppBar(),
        body: SingleChildScrollView(child: ActuWidget()));
  }
}

class ActuWidget extends StatelessWidget {
  const ActuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ImageNews(),
          TitleNews(),
          YellowBar(),
          Text(
            "Matchs",
            style: TextStylePronochain.dosisLight45,
          ),
          MatchsNews(),
          YellowBar(),
          Text(
            "Pronostic",
            style: TextStylePronochain.dosisLight45,
          ),
          PronosticNews(),
          YellowBar()
        ],
      ),
    );
  }
}

class ImageNews extends StatelessWidget {
  const ImageNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage(
        'images/actu.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        fit: BoxFit.contain); //<- Creates a widget that displays an image.
    return Container(
        alignment: Alignment.center,
        height: 150,
        // margin: const EdgeInsets.fromLTRB(1, 5, 1, 1),
        // padding: const EdgeInsets.fromLTRB(25, 45, 25, 25),
        child: image);
  }
}

class TitleNews extends StatelessWidget {
  const TitleNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'News',
      textAlign: TextAlign.center,
      style: TextStylePronochain.poppinsExtraBold46,
    );
  }
}

class YellowBar extends StatelessWidget {
  const YellowBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: const Divider(
        color: ColorStylePronochain.yellow,
        thickness: 2,
      ),
    );
  }
}

class MatchsNews extends StatelessWidget {
  const MatchsNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> matchs = [
      "NathGrrrr",
      "Zixo",
      "Pêcheurs",
      "bitcoin",
      "Jean",
      "NathGrrrr",
      "Zixo",
      "Pêcheurs",
      "bitcoin",
      "Jean"
    ];
    List<String> inProgress = [
      "On going",
      "Finish",
      "Today",
      "In the week",
      "In the month",
    ];
    return Container(
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
            itemCount: inProgress.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Frame(
                  topChild: Text(
                    inProgress[index],
                    style: TextStylePronochain.dosisRegular22,
                  ),
                  bottomChild: Container(
                      color: ColorStylePronochain.backgroundColor,
                      child: Row(children: const [
                        Icon(
                          Icons.schedule,
                          color: ColorStylePronochain.white,
                        ),
                        Text(
                          "15/01/22",
                          style: TextStylePronochain.dosisLight15,
                        )
                      ])),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 10),
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://upload.wikimedia.org/wikipedia/fr/thumb/5/51/Logo_Chelsea.svg/1200px-Logo_Chelsea.svg.png"),
                                              ),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 20),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "9 - 9",
                                            textAlign: TextAlign.end,
                                            style: TextStylePronochain
                                                .dosisLight15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 10),
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.055,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.055,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://upload.wikimedia.org/wikipedia/fr/thumb/5/51/Logo_Chelsea.svg/1200px-Logo_Chelsea.svg.png"),
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          5, 0, 10, 0),
                                      child: const Icon(
                                        Icons.sports_soccer,
                                        color: ColorStylePronochain.white,
                                      ),
                                    ),
                                    const Text(
                                      "7" " min",
                                      style: TextStylePronochain.dosisLight15,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )));
            }));
  }
}

class PronosticNews extends StatelessWidget {
  const PronosticNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> equipes = [
      "Lyon",
      "Paris",
      "Auxerre",
      "Dijon",
      "Liverpool",
      "NathGrrrr",
      "Zixo",
      "Pêcheurs",
      "bitcoin",
      "Jean"
    ];
    List<String> inProgress = [
      "On going",
      "Finish",
      "Today",
      "In the week",
      "In the month",
    ];
    List<String> cote = [
      "2.1",
      "1.5",
      "5.4",
      "2.6",
      "0.1",
      "0.5",
      "0.6",
      "9.1",
      "10.5",
      "1.1"
    ];

    return Container(
        height: 150,
        margin: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: inProgress.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Frame(
                  topChild: Text(
                    inProgress[index],
                    style: TextStylePronochain.dosisRegular22,
                  ),
                  bottomChild: Container(
                      color: ColorStylePronochain.backgroundColor,
                      child: Row(children: const [
                        Icon(
                          Icons.schedule,
                          color: ColorStylePronochain.white,
                        ),
                        Text(
                          "15/01/22",
                          style: TextStylePronochain.dosisLight15,
                        )
                      ])),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          equipes[index],
                                          style:
                                              TextStylePronochain.dosisLight15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: const [
                                        Text(
                                          "9 - 9",
                                          textAlign: TextAlign.end,
                                          style:
                                              TextStylePronochain.dosisLight15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          equipes[index + 1],
                                          style:
                                              TextStylePronochain.dosisLight15,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Row(
                                children: [
                                  const Text(
                                    "Result of match : ",
                                    style: TextStylePronochain.dosisLight15,
                                  ),
                                  Text(
                                    equipes[index],
                                    style: TextStylePronochain.dosisLight15,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Cote : ",
                                      style: TextStylePronochain.dosisLight15,
                                    ),
                                    Text(
                                      cote[index],
                                      style: TextStylePronochain.dosisLight15,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )));
            }));
  }
}
