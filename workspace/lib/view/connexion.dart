import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/delayed_animation.dart';

import '../text_style.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TitleConnexion(),
              ImageConnexion(),
              UsernameConnexion(),
              ConnectButton()
            ],
          ),
        ));
  }
}

class TitleConnexion extends StatelessWidget {
  const TitleConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
        delay: 500,
        child: Container(
          height: 100,
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 5),
          child: Column(children: [
            Row(
              children: const [
                Expanded(
                    child: Text(
                  'Connexion',
                  textAlign: TextAlign.center,
                  style: TextStylePronochain.poppinsExtraBold46,
                ))
              ],
            )
          ]),
        ));
  }
}

class ImageConnexion extends StatelessWidget {
  const ImageConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage(
        'images/pronochain.png'); //<- Creates an object that fetches an image.
    var image = Image(
        image: assetsImage,
        fit: BoxFit.contain); //<- Creates a widget that displays an image.
    return DelayedAnimation(
        delay: 1500,
        child: Container(
            height: 250,
            padding: const EdgeInsets.fromLTRB(25, 45, 25, 25),
            child: image));
  }
}

class UsernameConnexion extends StatelessWidget {
  const UsernameConnexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
        delay: 2000,
        child: Container(
          height: 150,
          padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
          child: Column(children: [
            Row(children: const [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    fillColor: ColorStylePronochain.white,
                    filled: true,
                    labelText: 'Username'),
              ))
            ])
          ]),
        ));
  }
}

class ConnectButton extends StatelessWidget {
  const ConnectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
        delay: 2500,
        child: Container(
          height: 150,
          padding: const EdgeInsets.fromLTRB(60, 25, 60, 60),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                    child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: ColorStylePronochain.white,
                    backgroundColor: ColorStylePronochain.blue,
                    textStyle: const TextStyle(fontSize: 30),
                  ),
                  onPressed: () {},
                  child: const Text('Connect wallet',
                      style: TextStylePronochain.dosisRegular30Black),
                ))
              ],
            )
          ]),
        ));
  }
}
