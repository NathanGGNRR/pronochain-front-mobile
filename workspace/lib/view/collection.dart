import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/horizontale_line_text.dart';
import 'package:pronochain/view/widget/popup_filtre.dart';
import 'package:pronochain/view/widget/popup_sort.dart';

import '../text_style.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TitleCollection(),
              HorizontalLineText(
                label: "FuzIooon",
                height: 1,
              ),
              SearchCollection(),
              SortingButtonCollection(),
              CollectionList()
            ],
          ),
        ));
  }
}

Widget _buildPopupDetailCard(BuildContext context, int index) {
  return AlertDialog(
    backgroundColor: ColorStylePronochain.backgroundColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
        side: BorderSide(width: 1, color: ColorStylePronochain.yellow)),
    content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                color: ColorStylePronochain.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Text(
            "Name $index",
            style: TextStylePronochain.dosisLight45,
          ),
          Image.network(
            "https://robohash.org/$index",
            height: 350,
            width: 250,
          ),
          Text(
            "Score : $index",
            style: TextStylePronochain.dosisLight25,
          )
        ]),
  );
}

class TitleCollection extends StatelessWidget {
  const TitleCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 69,
      child: Column(children: [
        Row(
          children: const [
            Expanded(
                child: Text(
              'Collection',
              textAlign: TextAlign.center,
              style: TextStylePronochain.poppinsExtraBold46,
            ))
          ],
        )
      ]),
    );
  }
}

class SearchCollection extends StatelessWidget {
  const SearchCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(children: [
        Row(children: [
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
                  hintText: 'Card name...',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
          ),
          Container(
              height: 49,
              width: 63,
              decoration: BoxDecoration(
                color: ColorStylePronochain.blue,
                borderRadius: BorderRadius.circular(6),
              ),
              margin: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: const Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ))
        ])
      ]),
    );
  }
}

class SortingButtonCollection extends StatelessWidget {
  const SortingButtonCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 50,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: ColorStylePronochain.white,
                backgroundColor: ColorStylePronochain.yellow,
                textStyle: const TextStyle(fontSize: 30),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const PopupSort(
                    title: 'Sort',
                  ),
                );
              },
              child: const Text('Sort',
                  style: TextStylePronochain.dosisRegular30Black),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: ColorStylePronochain.white,
                backgroundColor: ColorStylePronochain.yellow,
                textStyle: const TextStyle(fontSize: 30),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const PopupFiltre(
                    child: ContentPopupFiltre(),
                  ),
                );
              },
              child: const Text('Filter',
                  style: TextStylePronochain.dosisRegular30Black),
            ),
            Container(
              width: 50,
            ),
          ],
        ));
  }
}

class CollectionList extends StatelessWidget {
  const CollectionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(40, (index) {
          return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDetailCard(context, index));
              },
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  height: MediaQuery.of(context).size.height *
                      0.3, // ignore this, cos I am giving height to the container
                  width: MediaQuery.of(context).size.width *
                      0.5, // ignore this, cos I am giving width to the container
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://robohash.org/$index'))),
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      color: ColorStylePronochain
                          .white, // if rarity changer couleur
                      padding: const EdgeInsets.all(
                          5.0), //some spacing to the child from bottom
                      child: Text('Name $index',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight
                                  .bold) // This aligns the child of the container
                          ))));
        }),
      ),
    );
  }
}

class ContentPopupFiltre extends StatefulWidget {
  const ContentPopupFiltre({Key? key}) : super(key: key);

  @override
  _ContentPopupFiltre createState() => _ContentPopupFiltre();
}

class _ContentPopupFiltre extends State<ContentPopupFiltre> {
  final nationality = ['French', 'English', 'German', 'Spannish', 'Portugal'];
  final club = ['DFCO', 'Paris', 'Liverpool', 'USCD sdf sdf '];
  final rarity = ['Common', 'Rare', 'Legendary', 'Gagniarre'];
  String selectedValue = 'French';
  String? dropdownValueClub;
  String? dropdownValueNation;
  String? dropdownValueRarity;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Club :",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: PoliceStylePronochain.dosisLight,
                        color: ColorStylePronochain.white,
                        fontSize: 17)),
                Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: ColorStylePronochain.backgroundColor,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValueClub,
                      style: TextStylePronochain.dosisLight15,
                      hint: const Text('Select a club',
                          softWrap: true,
                          style: TextStylePronochain.dosisLight15),
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueClub = newValue!;
                        });
                      },
                      items: club.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Nationality :",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: PoliceStylePronochain.dosisLight,
                        color: ColorStylePronochain.white,
                        fontSize: 17)),
                Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: ColorStylePronochain.backgroundColor,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValueNation,
                      style: TextStylePronochain.dosisLight15,
                      hint: const Text('Select a nationality',
                          style: TextStylePronochain.dosisLight15),
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueNation = newValue!;
                        });
                      },
                      items: nationality
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rarity :",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: PoliceStylePronochain.dosisLight,
                      color: ColorStylePronochain.white,
                      fontSize: 17),
                ),
                Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: ColorStylePronochain.backgroundColor,
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropdownValueRarity,
                      style: TextStylePronochain.dosisLight15,
                      hint: const Text('Select a rarity',
                          style: TextStylePronochain.dosisLight15),
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueRarity = newValue!;
                        });
                      },
                      items:
                          rarity.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
              ],
            ),
          )
        ]);
  }
}
