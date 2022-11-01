import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:flutter/foundation.dart' as foundation;

Widget errorScreen(dynamic detailsException) {
  final dynamic detailsExceptions = detailsException;
  return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TitleError(),
            const ImageError(),
            ExceptionMessage(detailsExceptions)
          ],
        ),
      ));
}

class TitleError extends StatelessWidget {
  const TitleError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
      child: Column(children: [
        Row(
          children: const [
            Expanded(
                child: Text(
              'An error has occurred',
              textAlign: TextAlign.center,
              style: TextStylePronochain.poppinsExtraBold48,
            ))
          ],
        )
      ]),
    );
  }
}

class ImageError extends StatelessWidget {
  const ImageError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage(
        'images/bug.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        fit: BoxFit.contain); //<- Creates a widget that displays an image.
    return Container(
        height: 300,
        margin: const EdgeInsets.fromLTRB(1, 25, 1, 1),
        padding: const EdgeInsets.fromLTRB(25, 45, 25, 25),
        child: image);
  }
}

class ExceptionMessage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ExceptionMessage(this.detailsExceptions);

  final dynamic detailsExceptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: //Check is it release mode
                  foundation.kReleaseMode
                      //Widget for release mode
                      ? const Center(
                          child: Text(
                            'Sorry for inconvenience',
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        )
                      //Widget for debug mode
                      : SingleChildScrollView(
                          child: Text(
                          'EXCEPTION DETAILS:\n\n$detailsExceptions',
                          style: TextStylePronochain.dosisRegular20,
                        )),
            )
          ],
        )
      ]),
    );
  }
}
