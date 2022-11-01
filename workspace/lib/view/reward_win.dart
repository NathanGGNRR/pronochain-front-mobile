import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/delayed_animation.dart';

import '../text_style.dart';

class RewardWin extends StatelessWidget {
  const RewardWin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TitleBloc(),
              RewardImage(),
              TextDescription(),
              MintBloc(),
            ],
          ),
        ));
  }
}

class TitleBloc extends StatelessWidget {
  const TitleBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(children: [
        Row(
          children: const [
            Expanded(
                child: Text('You have a reward !',
                    textAlign: TextAlign.center,
                    style: TextStylePronochain.poppinsExtraBold46))
          ],
        )
      ]),
    );
  }
}

class RewardImage extends StatelessWidget {
  const RewardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetsImageNft = const AssetImage(
        'images/wallet.png'); //<- Creates an object that fetches an image.
    var imageNft = Image(
        image: assetsImageNft,
        fit: BoxFit.contain); //<- Creates a widget that displays an image.
    return DelayedAnimation(
        delay: 1500,
        child: SizedBox(
          height: 400,
          child: imageNft,
        ));
  }
}

class TextDescription extends StatelessWidget {
  const TextDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      child: Text(
        "You can mint it now to be able to view your NFT or wait until later!",
        textAlign: TextAlign.center,
        style: TextStylePronochain.dosisLight25,
      ),
    );
  }
}

class MintBloc extends StatelessWidget {
  const MintBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: ColorStylePronochain.white,
                backgroundColor: ColorStylePronochain.blue,
                textStyle: TextStylePronochain.dosisRegular30,
              ),
              onPressed: () {},
              child: const Text('Mint',
                  style: TextStylePronochain.dosisRegular30Black),
            )),
          ],
        )
      ]),
    );
  }
}
