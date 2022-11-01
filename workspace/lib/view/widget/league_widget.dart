import 'package:flutter/material.dart';
import 'package:pronochain/text_style.dart';
import 'package:pronochain/view/league/league_details.dart';
import 'package:pronochain/view/widget/frame.dart';

class LeagueWidget extends StatefulWidget {
  const LeagueWidget({Key? key}) : super(key: key);

  @override
  _AppLeagueWidgetState createState() => _AppLeagueWidgetState();
}

class _AppLeagueWidgetState extends State<LeagueWidget> {
  @override
  Widget build(BuildContext context) {
    return const Frame(
      topChild: Top(),
      child: Content(),
      bottomChild: Bottom(),
      bottomPosition: -3,
      topPosition: 5,
    );
  }
}

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: const Text('Ligue Diamant',
          style: TextStyle(
              color: ColorStylePronochain.white,
              fontFamily: PoliceStylePronochain.dosisRegular,
              fontSize: 22)),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<- Creates a widget that displays an image.
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 40, 10),
            child: Icon(Icons.lock_sharp,
                color: ColorStylePronochain.white, size: 50),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: const [
                    Icon(
                      Icons.emoji_events,
                      color: ColorStylePronochain.white,
                      size: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Diamant 1',
                          style: TextStyle(
                              color: ColorStylePronochain.white,
                              fontFamily: PoliceStylePronochain.dosisLight,
                              fontSize: 15),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: const [
                    Icon(
                      Icons.person,
                      color: ColorStylePronochain.white,
                      size: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          '99 / 100',
                          style: TextStyle(
                              color: ColorStylePronochain.white,
                              fontFamily: PoliceStylePronochain.dosisLight,
                              fontSize: 15),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: const [
                    Icon(
                      Icons.schedule,
                      color: ColorStylePronochain.white,
                      size: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          '31 Dec. 2022',
                          style: TextStyle(
                              color: ColorStylePronochain.white,
                              fontFamily: PoliceStylePronochain.dosisLight,
                              fontSize: 15),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //<- Creates a widget that displays an image.
    return Container(
        decoration: BoxDecoration(
            color: ColorStylePronochain.blue,
            borderRadius: BorderRadius.circular(6)),
        child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LeagueDetails()),
                (route) => false);
          },
          child: const Text('Visualiser',
              style: TextStyle(
                  color: ColorStylePronochain.backgroundColor,
                  fontFamily: PoliceStylePronochain.dosisLight,
                  fontSize: 15)),
          style: TextButton.styleFrom(
              primary: ColorStylePronochain.backgroundColor),
        ));
  }
}
