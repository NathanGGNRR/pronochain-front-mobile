import 'package:flutter/material.dart';
import 'package:pronochain/main.dart';
import 'package:pronochain/view/widget/frame.dart';
import 'package:pronochain/view/widget/odds.dart';
import 'package:pronochain/view/widget/page_with_list.dart';
import '/text_style.dart';

class MatchsPage extends StatelessWidget {
  final List<String> teamName;

  const MatchsPage(
      {Key? key,
      this.teamName = const [
        "Team 1",
        "Team 2",
        "Team 3",
        "Team 4",
        "Team 5",
        "Team 6"
      ]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithList(
      title: "Pronostics",
      itemBuilder: buildListItem,
      nbItem: teamName.length - 1,
      searchPlaceHolder: 'Team name',
      filterWidget: const PopupFilter(),
    );
  }

  Frame buildListItem(BuildContext context, int index) {
    return Frame(
        bottomChild: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(5.0),
            backgroundColor: ColorStylePronochain.green,
            textStyle: TextStylePronochain.dosisRegular22,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => const PopUpPronostic(),
            );
          },
          child: const Text('Pronostic',
              style: TextStylePronochain.dosisRegular30Black),
        ),
        topChild: const Text("League 1"),
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
                  const Text(
                    " - ",
                    style: TextStylePronochain.dosisLight25,
                  ),
                  Text(
                    teamName[index + 1],
                    style: TextStylePronochain.dosisLight25,
                  ),
                ],
              ),
              Row(children: [
                Odds(
                  label: teamName[index],
                  odds: 3,
                ),
                const Odds(
                  label: "Draw",
                  odds: 2,
                ),
                Odds(
                  label: teamName[index + 1],
                  odds: 1,
                ),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "22/05/2022 21h",
                    style: TextStylePronochain.dosisLight15,
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class PopupFilter extends StatefulWidget {
  const PopupFilter({Key? key}) : super(key: key);

  @override
  PopupFilterState createState() => PopupFilterState();
}

class PopupFilterState extends State<PopupFilter> {
  final league = ['Ligue 1', 'Ligue 2', 'Champions League', 'World Cup'];
  String selectedValue = 'Champions League';
  String? dropdownValueLeague;
  DateTime date = DateTime.now();
  DateTime? selectedDate;

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
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    child: const Text(
                      "League :",
                      style: TextStylePronochain.dosisLight15,
                    )),
                Theme(
                    data: Theme.of(context).copyWith(
                        canvasColor: ColorStylePronochain.backgroundColor),
                    child: DropdownButton<String>(
                      value: dropdownValueLeague,
                      style: TextStylePronochain.dosisLight15,
                      hint: const Text('Select a club',
                          style: TextStylePronochain.dosisLight15),
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueLeague = newValue!;
                        });
                      },
                      items:
                          league.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStylePronochain.dosisLight15,
                          ),
                        );
                      }).toList(),
                    ))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  child: const Text(
                    "Date :",
                    style: TextStylePronochain.dosisLight15,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorStylePronochain.white),
                  onPressed: () {
                    _selectDate(context);
                  },
                  onLongPress: () {
                    setState(() {
                      selectedDate = null;
                    });
                  },
                  child: Text(
                      "${selectedDate != null ? selectedDate?.day : "dd"}/${selectedDate != null ? selectedDate?.month : "mm"}/${selectedDate != null ? selectedDate?.year : "yyyy"}",
                      style: TextStylePronochain.dosisRegular15Black),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "22/05/2022 21h",
                  style: TextStylePronochain.dosisLight15,
                )
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

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(const Duration(days: 365)),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
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
