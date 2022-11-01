import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';

class Frame extends StatefulWidget {
  final Widget child;
  final Widget? topChild;
  final Widget? bottomChild;
  final double? bottomPosition;
  final double? topPosition;

  const Frame({
    Key? key,
    required this.child,
    this.topChild,
    this.bottomChild,
    this.bottomPosition,
    this.topPosition,
  }) : super(key: key);

  @override
  _AppFrameState createState() => _AppFrameState();
}

class _AppFrameState extends State<Frame> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          decoration: BoxDecoration(
            border: Border.all(color: ColorStylePronochain.yellow, width: 1),
            borderRadius: BorderRadius.circular(6),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: [
              Container(
                child: widget.child,
              )
            ],
          ),
        ),
        Positioned(
            left: 30,
            top: widget.topPosition,
            child: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              color: ColorStylePronochain.backgroundColor,
              child: widget.topChild,
            )),
        Positioned(
            bottom: widget.bottomPosition,
            right: 30,
            child: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              color: ColorStylePronochain.backgroundColor,
              child: widget.bottomChild,
            )),
      ],
    );
  }
}
