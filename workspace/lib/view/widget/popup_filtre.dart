import 'package:flutter/material.dart';
import '../../text_style.dart';

class PopupFiltre extends StatefulWidget {
  final Widget child;

  const PopupFiltre({Key? key, required this.child}) : super(key: key);

  @override
  _PopupFiltre createState() => _PopupFiltre();
}

class _PopupFiltre extends State<PopupFiltre> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorStylePronochain.backgroundColor,
              borderRadius: BorderRadius.circular(Constants.padding),
              border: Border.all(color: ColorStylePronochain.yellow, width: 1),
            ),
            child: widget.child),
        Positioned(
          left: 18,
          top: 45,
          child: Container(
            height: 1,
            width: 68,
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: ColorStylePronochain.backgroundColor,
          ),
        ),
        Positioned(
          left: 18,
          top: 30,
          child: Container(
              margin: const EdgeInsets.only(left: 15),
              color: Colors.transparent,
              child: const Text('Filtre',
                  style: TextStyle(
                      color: ColorStylePronochain.white,
                      fontFamily: PoliceStylePronochain.poppinsBold,
                      fontSize: 22))),
        ),
        Positioned(
          bottom: -1,
          right: 27,
          child: Container(
            height: 2,
            width: 94,
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: ColorStylePronochain.backgroundColor,
          ),
        ),
        Positioned(
          bottom: -10,
          right: 40,
          child: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: const BottomButton()),
        )
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 39,
            height: 27,
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
                color: ColorStylePronochain.green,
                borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.done_outlined),
            )),
        Container(
            width: 39,
            height: 27,
            decoration: BoxDecoration(
                color: ColorStylePronochain.pink,
                borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.clear_outlined),
            ))
      ],
    );
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
}
