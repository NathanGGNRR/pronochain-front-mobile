import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/frame.dart';
import 'package:pronochain/view/widget/page_with_list.dart';
import '/text_style.dart';

class Teams extends StatelessWidget {
  List<String> teamName = [];

  @override
  Widget build(BuildContext context) {
    teamName = List<String>.generate(5, (i) => "Team $i");
    return PageWithList(
      title: "Teams",
      itemBuilder: buildListItem,
      nbItem: teamName.length,
      additionnalElement: const [TeamADD()],
    );
  }

  Frame buildListItem(BuildContext context, int index) {
    final teamName = List<String>.generate(5, (i) => "Team $i");
    var assetsWin = const AssetImage('images/win.png');
    var win = Image(
      image: assetsWin,
      fit: BoxFit.contain,
      width: 40,
    );
    var assetsDefeat = const AssetImage('images/defeat.png');
    var defeat = Image(
      image: assetsDefeat,
      fit: BoxFit.contain,
      width: 40,
    );
    return Frame(
        bottomChild: Container(),
        topChild: Text(teamName[index]),
        child: Container(
            height: 200,
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Victoire / defaites
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              win,
                              const Text(
                                "9",
                                style: TextStylePronochain.dosisLight45,
                              ),
                              const Text(
                                " - ",
                                style: TextStylePronochain.dosisLight45,
                              ),
                              const Text(
                                "9",
                                style: TextStylePronochain.dosisLight45,
                              ),
                              defeat
                            ],
                          ),
                          // Score
                          Row(
                            children: [
                              Text("Score : $index",
                                  style: TextStylePronochain.dosisLight36)
                            ],
                          ),
                          // Bouton
                          Row(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(16.0),
                                  primary: ColorStylePronochain.white,
                                  backgroundColor: ColorStylePronochain.yellow,
                                  textStyle: TextStylePronochain.dosisRegular30,
                                ),
                                onPressed: () {},
                                child: const Text('Show',
                                    style: TextStylePronochain
                                        .dosisRegular30Black),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ])));
  }
}

class TeamADD extends StatelessWidget {
  const TeamADD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 49,
            width: 63,
            decoration: BoxDecoration(
              color: ColorStylePronochain.green,
              borderRadius: BorderRadius.circular(6),
            ),
            margin: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () {},
            ))
      ],
    );
  }
}
