import 'package:flutter/material.dart';
import '/text_style.dart';

class SortAndFilterBar extends StatelessWidget {
  final StatefulWidget? sortWidget;
  final StatefulWidget? filterWidget;

  const SortAndFilterBar({Key? key, this.filterWidget, this.sortWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [
      Container(
        width: 50,
      )
    ];
    if (sortWidget != null) {
      buttons.add(TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: ColorStylePronochain.white,
          backgroundColor: ColorStylePronochain.yellow,
          textStyle: const TextStyle(fontSize: 30),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => sortWidget ?? Container(),
          );
        },
        child:
            const Text('Sort', style: TextStylePronochain.dosisRegular30Black),
      ));
    }
    if (filterWidget != null) {
      buttons.add(TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: ColorStylePronochain.white,
          backgroundColor: ColorStylePronochain.yellow,
          textStyle: const TextStyle(fontSize: 30),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => filterWidget ?? Container(),
          );
        },
        child: const Text('Filter',
            style: TextStylePronochain.dosisRegular30Black),
      ));
    }
    buttons.add(Container(
      width: 50,
    ));
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons,
        ));
  }
}
