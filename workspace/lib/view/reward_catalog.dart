import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/popup_filter_catalog.dart';
import 'package:pronochain/view/widget/popup_sort_catalog.dart';

import '../text_style.dart';

class RewardCatalog extends StatelessWidget {
  const RewardCatalog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TitleRewardCatalog(),
              SearchCatalog(),
              SortingButtonCatalog(),
              CatalogList(),
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
    // title: const Text('Sort', style: TextStylePronochain.poppinsBold45),
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
          Image.network(
            "https://robohash.org/$index?set=set2",
            height: 350,
            width: 250,
          ),
          Text(
            "Rarity $index",
            style: TextStylePronochain.dosisLight25,
          )
        ]),
  );
}

class TitleRewardCatalog extends StatelessWidget {
  const TitleRewardCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 69,
      child: Column(children: [
        Row(
          children: const [
            Expanded(
                child: Text(
              'Catalog',
              textAlign: TextAlign.center,
              style: TextStylePronochain.poppinsExtraBold46,
            ))
          ],
        )
      ]),
    );
  }
}

class SearchCatalog extends StatelessWidget {
  const SearchCatalog({Key? key}) : super(key: key);

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
                  hintText: 'Part name or rarity...',
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

class SortingButtonCatalog extends StatelessWidget {
  const SortingButtonCatalog({Key? key}) : super(key: key);

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
                  builder: (BuildContext context) => const PopupSortCatalog(
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
                  builder: (BuildContext context) => const PopupFilterCatalog(
                    title: 'Filter',
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

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

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
                          image: NetworkImage(
                              'https://robohash.org/$index?set=set2'))),
                  alignment: Alignment
                      .bottomCenter, // This aligns the child of the container
                  child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      color: ColorStylePronochain
                          .pink, // if rarity changer couleur
                      padding: const EdgeInsets.all(
                          5.0), //some spacing to the child from bottom
                      child: Text('Rarity : $index',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)))));
        }),
      ),
    );
  }
}
