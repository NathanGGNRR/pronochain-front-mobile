import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final Function(BuildContext, int) itemBuilder;
  final int nbItem;
  final double height;

  const ListWidget(
      {Key? key,
      required this.itemBuilder,
      required this.nbItem,
      this.height = 650})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: nbItem,
        itemBuilder: (context, index) {
          return itemBuilder(context, index);
        },
      ),
    );
  }
}
