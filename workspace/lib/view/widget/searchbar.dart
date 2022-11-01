import 'package:flutter/material.dart';
import '/text_style.dart';

class SearchBarWidget extends StatelessWidget {
  final String? placeHolder;
  const SearchBarWidget({Key? key, this.placeHolder = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(children: [
        Row(children: [
          Expanded(
            child: SizedBox(
              height: 49,
              child: TextField(
                obscureText: false,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: ColorStylePronochain.backgroundColor,
                    fontFamily: PoliceStylePronochain.dosisRegular,
                    fontSize: 22),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: placeHolder,
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
