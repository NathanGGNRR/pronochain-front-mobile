import 'package:flutter/material.dart';

import '../../text_style.dart';

class PopupSort extends StatefulWidget {
  const PopupSort({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  PopupSortState createState() => PopupSortState();
}

class PopupSortState extends State<PopupSort> {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  String selectedValue = 'Item 1';
  String? dropdownValue;
  bool selected = true;
  int numberName = 0;
  int numberClub = 0;
  int numberNationality = 0;
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
                  "Name",
                  style: TextStylePronochain.dosisLight15,
                ),
                TextButton.icon(
                  icon: Icon(numberName == 0
                      ? Icons.close
                      : numberName == 1
                          ? Icons.expand_more
                          : Icons.expand_less),
                  label: Text(numberName == 0
                      ? 'None'
                      : numberName == 1
                          ? 'Descending'
                          : 'Ascending'),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                      numberClub = 0;
                      numberNationality = 0;
                      numberRarity = 0;
                      if (numberName > 1) {
                        numberName = 0;
                      } else {
                        numberName++;
                      }
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Club", style: TextStylePronochain.dosisLight15),
                TextButton.icon(
                  icon: Icon(numberClub == 0
                      ? Icons.close
                      : numberClub == 1
                          ? Icons.expand_more
                          : Icons.expand_less),
                  label: Text(numberClub == 0
                      ? 'None'
                      : numberClub == 1
                          ? 'Descending'
                          : 'Ascending'),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                      numberName = 0;
                      numberNationality = 0;
                      numberRarity = 0;
                      if (numberClub > 1) {
                        numberClub = 0;
                      } else {
                        numberClub++;
                      }
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Nationality",
                    style: TextStylePronochain.dosisLight15),
                TextButton.icon(
                  icon: Icon(numberNationality == 0
                      ? Icons.close
                      : numberNationality == 1
                          ? Icons.expand_more
                          : Icons.expand_less),
                  label: Text(numberNationality == 0
                      ? 'None'
                      : numberNationality == 1
                          ? 'Descending'
                          : 'Ascending'),
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                      numberName = 0;
                      numberClub = 0;
                      numberRarity = 0;
                      if (numberNationality > 1) {
                        numberNationality = 0;
                      } else {
                        numberNationality++;
                      }
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Rareté", style: TextStylePronochain.dosisLight15),
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
                      numberName = 0;
                      numberNationality = 0;
                      numberClub = 0;
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
