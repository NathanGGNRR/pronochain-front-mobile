import 'package:flutter/material.dart';

import '../../text_style.dart';

class PopupSortCatalog extends StatefulWidget {
  const PopupSortCatalog({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  PopupSortCatalogState createState() => PopupSortCatalogState();
}

class PopupSortCatalogState extends State<PopupSortCatalog> {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  String selectedValue = 'Item 1';
  String? dropdownValue;
  bool selected = true;
  int numberPartOfFace = 0;
  int numberRarity = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStylePronochain.backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          side: BorderSide(width: 1, color: ColorStylePronochain.yellow)),
      title: const Text('Sort', style: TextStylePronochain.poppinsBold45),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Rarity",
                  style: TextStylePronochain.dosisLight15,
                ),
                TextButton.icon(
                  icon: Icon(numberRarity == 0
                      ? Icons.close
                      : numberRarity == 1
                          ? Icons.expand_more
                          : Icons.expand_less),
                  label: Text(numberRarity == 0
                      ? 'None'
                      : numberRarity == 1
                          ? 'Descending'
                          : 'Ascending'),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                      if (numberPartOfFace != 0) {
                        numberPartOfFace = 0;
                      }
                      if (numberRarity > 1) {
                        numberRarity = 0;
                      } else {
                        numberRarity++;
                      }
                    });
                  },
                )
              ],
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     const Text("Part of face",
            //         style: TextStylePronochain.dosisLight15),
            //     TextButton.icon(
            //       icon: Icon(numberPartOfFace == 0
            //           ? Icons.close
            //           : numberPartOfFace == 1
            //               ? Icons.expand_more
            //               : Icons.expand_less),
            //       label: Text(numberPartOfFace == 0
            //           ? 'None'
            //           : numberPartOfFace == 1
            //               ? 'Descending'
            //               : 'Ascending'),
            //       onPressed: () {
            //         setState(() {
            //           selected = !selected;
            //           if (numberRarity != 0) {
            //             numberRarity = 0;
            //           }
            //           if (numberPartOfFace > 1) {
            //             numberPartOfFace = 0;
            //           } else {
            //             numberPartOfFace++;
            //           }
            //         });
            //       },
            //     )
            //   ],
            // ),
          ]),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
