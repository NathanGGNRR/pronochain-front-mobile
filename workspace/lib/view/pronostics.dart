import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/frame.dart';
import 'package:pronochain/view/widget/page_with_list.dart';
import '/text_style.dart';

class Pronostics extends StatelessWidget {
  final List<String> teamName;
  final String pseudo;

  const Pronostics(
      {Key? key,
      this.teamName = const [
        "Team 1",
        "Team 2",
        "Team 3",
        "Team 4",
        "Team 5",
        "Team 6"
      ],
      this.pseudo = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithList(
      title: pseudo == "" ? "My pronostics" : "Pronostics",
      itemBuilder: buildListItem,
      nbItem: teamName.length - 1,
      searchPlaceHolder: 'Team name',
      filterWidget: const PopupFilter(),
      pseudo: pseudo,
    );
  }

  GestureDetector buildListItem(BuildContext context, int index) {
    final randomNumberGenerator = Random();
    bool matchDone = randomNumberGenerator.nextBool();
    bool pronosticWon = randomNumberGenerator.nextBool();
    String pronostic = teamName[index];
    double cote = 1.50;
    String winingTeam = matchDone ? teamName[index] : "";
    Color titleColor = ColorStylePronochain.white;
    Icon icon = const Icon(
      Icons.schedule,
      color: ColorStylePronochain.white,
    );
    if (matchDone) {
      icon = const Icon(
        Icons.flag,
        color: ColorStylePronochain.white,
      );
      titleColor =
          pronosticWon ? ColorStylePronochain.green : ColorStylePronochain.pink;
    }
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const PopUpPronostic(),
          );
        },
        child: Frame(
            bottomChild: Container(
                color: ColorStylePronochain.backgroundColor,
                child: Row(children: [
                  icon,
                  const Text(
                    "12 Jan. 2022",
                    style: TextStylePronochain.dosisLight15,
                  )
                ])),
            topChild: Text(pronostic),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        teamName[index],
                        style: TextStylePronochain.dosisLight25,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        child: const Text(
                          "2 - 0",
                          style: TextStylePronochain.dosisLight25,
                        ),
                      ),
                      Text(
                        teamName[index + 1],
                        style: TextStylePronochain.dosisLight25,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Match's result: " + winingTeam,
                        style: TextStylePronochain.dosisLight15,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rating: " + cote.toString(),
                        style: TextStylePronochain.dosisLight15,
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

class PopupFilter extends StatefulWidget {
  const PopupFilter({Key? key}) : super(key: key);

  @override
  PopupFilterState createState() => PopupFilterState();
}

class PopupFilterState extends State<PopupFilter> {
  bool? aVenir;
  bool? enCour;
  bool? termine;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStylePronochain.backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          side: BorderSide(width: 1, color: ColorStylePronochain.yellow)),
      title: const Text('Filter', style: TextStylePronochain.poppinsBold45),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckboxListTile(
                  title: const Text(
                    "A venir",
                    style: TextStylePronochain.dosisLight15,
                  ),
                  value: aVenir ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      aVenir = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  checkboxShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  activeColor: ColorStylePronochain.yellow,
                ),
                CheckboxListTile(
                  title: const Text(
                    "En cour",
                    style: TextStylePronochain.dosisLight15,
                  ),
                  value: enCour ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      enCour = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  checkboxShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  activeColor: ColorStylePronochain.yellow,
                ),
                CheckboxListTile(
                  title: const Text(
                    "Termine",
                    style: TextStylePronochain.dosisLight15,
                  ),
                  value: termine ?? false,
                  onChanged: (newValue) {
                    setState(() {
                      termine = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  checkboxShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  activeColor: ColorStylePronochain.yellow,
                ),
              ],
            )
          ]),
      actions: <Widget>[
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.00),
              color: ColorStylePronochain.green,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.check),
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.00),
              color: ColorStylePronochain.pink,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            )),
      ],
    );
  }
}

class PopUpPronostic extends StatefulWidget {
  const PopUpPronostic({Key? key}) : super(key: key);

  @override
  PopUpPronosticState createState() => PopUpPronosticState();
}

class PopUpPronosticState extends State<PopUpPronostic> {
  String? selectedResult;
  Border borderSelected =
      Border.all(color: ColorStylePronochain.green, width: 2.0);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStylePronochain.backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          side: BorderSide(width: 1, color: ColorStylePronochain.yellow)),
      title: const Text('My pronostic',
          style: TextStylePronochain.poppinsExtraBold25),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "team 1",
                style: TextStylePronochain.dosisLight15,
              ),
              Text(
                " - ",
                style: TextStylePronochain.dosisLight15,
              ),
              Text(
                "team 2",
                style: TextStylePronochain.dosisLight15,
              ),
            ],
          ),
          Row(children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.00),
                  border: selectedResult == "team1" ? borderSelected : null,
                  color: ColorStylePronochain.yellow,
                ),
                margin: const EdgeInsets.only(top: 5),
                child: TextButton(
                  onPressed: () => {
                    setState(() {
                      selectedResult = "team1";
                    })
                  },
                  child: Column(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 0, right: 10, top: 5),
                        child: Text("team 1",
                            style: TextStyle(
                                fontFamily: PoliceStylePronochain.dosisRegular,
                                fontSize: 15))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("3",
                            style: TextStyle(
                                fontFamily: PoliceStylePronochain.dosisRegular,
                                fontSize: 10)))
                  ]),
                )),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.00),
                  border: selectedResult == "Draw" ? borderSelected : null,
                  color: ColorStylePronochain.yellow,
                ),
                margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: TextButton(
                  onPressed: () => setState(() {
                    selectedResult = "Draw";
                  }),
                  child: Column(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 0, right: 10, top: 5),
                        child: Text("Draw",
                            style: TextStyle(
                                fontFamily: PoliceStylePronochain.dosisRegular,
                                fontSize: 15))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("2",
                            style: TextStyle(
                                fontFamily: PoliceStylePronochain.dosisRegular,
                                fontSize: 10)))
                  ]),
                )),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.00),
                  border: selectedResult == "team2" ? borderSelected : null,
                  color: ColorStylePronochain.yellow,
                ),
                margin: const EdgeInsets.only(top: 5),
                child: TextButton(
                  onPressed: () => setState(() {
                    selectedResult = "team2";
                  }),
                  child: Column(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 0, right: 10, top: 5),
                        child: Text("team2",
                            style: TextStyle(
                                fontFamily: PoliceStylePronochain.dosisRegular,
                                fontSize: 15))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text("1",
                            style: TextStyle(
                                fontFamily: PoliceStylePronochain.dosisRegular,
                                fontSize: 10)))
                  ]),
                )),
          ]),
        ],
      ),
      actions: <Widget>[
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.00),
              color: ColorStylePronochain.green,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.check),
            )),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.00),
              color: ColorStylePronochain.pink,
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            )),
      ],
    );
  }
}
