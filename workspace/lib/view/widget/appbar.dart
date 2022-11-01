import 'package:flutter/material.dart';
import 'package:pronochain/main.dart';
import 'package:pronochain/view/connexion.dart';
import 'package:pronochain/view/league/league_details.dart';
import 'package:pronochain/view/league/league_matchs.dart';
import 'package:pronochain/view/league/league_search.dart';
import 'package:pronochain/view/profile.dart';
import 'package:pronochain/view/pronostics.dart';
import 'package:pronochain/view/reward_win.dart';
import '../../text_style.dart';
import 'package:pronochain/view/friend_page.dart';
import '../actu.dart';
import '../reward_catalog.dart';
import '../matchs.dart';

const colorBack = ColorStylePronochain.backgroundColor;

//App bar of top
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool userConnected = true;
    List<Widget> childs = [];
    if (userConnected) {
      childs = [
        IconButton(
          icon: const Icon(Icons.sports_soccer),
          color: ColorStylePronochain.white,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Pronostics()),
                (route) => false);
          },
        ),
        IconButton(
          icon: const Icon(Icons.supervised_user_circle),
          color: ColorStylePronochain.white,
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const FriendPage()),
                (route) => false);
          },
        ),
        IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                  (route) => false);
            },
            icon: const Icon(Icons.account_circle)),
      ];
    } else {
      childs = [
        IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Connexion()),
                  (route) => false);
            },
            icon: const Icon(Icons.account_circle)),
      ];
    }
    return AppBar(
      title: TextButton(
        style: TextButton.styleFrom(
          primary: ColorStylePronochain.white,
          textStyle: TextStylePronochain.poppinsExtraBold25,
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
              (route) => false);
        },
        child: const Text('Pronochain',
            style: TextStyle(fontFamily: 'Poppins Extra Bold')),
      ),
      backgroundColor: colorBack,
      actions: childs,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

//App bar of bottom
class MyBottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF353434),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.sports_soccer),
            color: ColorStylePronochain.white,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MatchsPage()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.emoji_events),
            color: ColorStylePronochain.white,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RewardCatalog()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.query_stats),
            color: ColorStylePronochain.white,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LeaguesSearch()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: const Icon(Icons.card_giftcard),
            color: ColorStylePronochain.white,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const RewardWin()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
