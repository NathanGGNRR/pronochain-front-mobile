import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/league/league_details.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/league_widget.dart';

class LeaguesSearch extends StatelessWidget {
  const LeaguesSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<- Creates a widget that displays an image.
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
          child: Column(children: const [
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 5),
              child: Text('Leagues',
                  textAlign: TextAlign.center,
                  style: TextStylePronochain.poppinsBold45),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
              child: SearchBar(),
            ),
            Filter(),
            LeagueWidget()
          ]),
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<- Creates a widget that displays an image.
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 49,
            child: TextField(
              obscureText: false,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: ColorStylePronochain.backgroundColor,
                  fontFamily: PoliceStylePronochain.dosisRegular,
                  fontSize: 22),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search Leagues',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ),
        Container(
          height: 49,
          width: 63,
          child: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LeagueDetails()),
                  (route) => false);
            },
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.search_outlined,
              size: 40,
            ),
          ),
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: ColorStylePronochain.blue,
            borderRadius: BorderRadius.circular(6),
          ),
        )
      ],
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Container(
              color: ColorStylePronochain.backgroundColor,
              margin: const EdgeInsets.only(left: 15, right: 4),
              child: const Divider(
                color: ColorStylePronochain.yellow,
                thickness: 1,
              ))),
      TextButton(
        onPressed: () {},
        child: const Text('Filter',
            style: TextStyle(
                color: ColorStylePronochain.backgroundColor,
                fontFamily: PoliceStylePronochain.dosisRegular,
                fontSize: 30)),
        style:
            TextButton.styleFrom(backgroundColor: ColorStylePronochain.yellow),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 4, right: 15),
            child: const Divider(color: ColorStylePronochain.yellow)),
      ),
    ]);
  }
}
