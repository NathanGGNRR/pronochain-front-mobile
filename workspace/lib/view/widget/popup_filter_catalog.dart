import 'package:flutter/material.dart';

import '../../text_style.dart';

class PopupFilterCatalog extends StatefulWidget {
  const PopupFilterCatalog({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  PopupFilterCatalogState createState() => PopupFilterCatalogState();
}

class PopupFilterCatalogState extends State<PopupFilterCatalog> {
  final nationality = ['French', 'English', 'German', 'Spannish', 'Portugal'];
  final partOfFace = ['Face', 'Hair', 'Eyes', 'beard'];
  final rarity = ['Common', 'Rare', 'Legendary', 'Gagniarre'];
  String selectedValue = 'French';
  String? dropdownValueClub;
  String? dropdownValueNatio;
  String? dropdownValueRarity;

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
      content: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Part :",
                    style: TextStylePronochain.dosisLight25,
                  ),
                  Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: ColorStylePronochain.backgroundColor,
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValueClub,
                        style: TextStylePronochain.dosisLight15,
                        hint: const Text('Select a part',
                            style: TextStylePronochain.dosisLight15),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueClub = newValue!;
                          });
                        },
                        items: partOfFace
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
                    style: TextStylePronochain.dosisLight25,
                  ),
                  Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: ColorStylePronochain.backgroundColor,
                      ),
                      child: DropdownButton<String>(
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
                        items: rarity
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))
                ],
              ),
            )
          ]),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Send them
            //var club = clubController.text;
            //var nationnality = nationnalityController.text;
            Navigator.pop(context);
          },
          child: const Text('Search'),
        ),
      ],
    );
  }
}
