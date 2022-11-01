import 'package:flutter/material.dart';
import 'package:pronochain/view/widget/appbar.dart';
import 'package:pronochain/view/widget/searchbar.dart';
import 'package:pronochain/view/widget/sort_filter_bar.dart';
import 'package:pronochain/view/widget/title_widget.dart';
import 'package:pronochain/view/widget/list_widget.dart';
import '/text_style.dart';

class PageWithList extends StatelessWidget {
  //tritre de la page
  final String title;
  //Style  du trie de la page
  final TextStyle titleStyle;
  //Fonction pour la construction des item de la liste
  final Function(BuildContext, int) itemBuilder;
  //Nombre d'item dans la liste
  final int nbItem;
  //Hauteur de la liste
  final double listHeight;
  //indique si on doit afficher une search bar ou non
  final bool displaySearchBar;
  //Place holder de la serach bar
  final String searchPlaceHolder;
  //Pseudo du propriètaire des informations affichées
  final String pseudo;
  final StatefulWidget? sortWidget;
  final StatefulWidget? filterWidget;
  final List<Widget> additionnalElement;

  const PageWithList(
      {Key? key,
      required this.title,
      this.titleStyle = TextStylePronochain.poppinsExtraBold46,
      required this.itemBuilder,
      required this.nbItem,
      this.listHeight = 650,
      this.displaySearchBar = false,
      this.searchPlaceHolder = "",
      this.pseudo = "",
      this.sortWidget,
      this.filterWidget,
      this.additionnalElement = const <Widget>[]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyChilds = [
      TitleWidget(
        text: title,
        textStyle: titleStyle,
      ),
    ];

    if (displaySearchBar == true || searchPlaceHolder != "") {
      bodyChilds.add(SearchBarWidget(placeHolder: searchPlaceHolder));
    }
    if (sortWidget != null || filterWidget != null) {
      bodyChilds.add(SortAndFilterBar(
        sortWidget: sortWidget,
        filterWidget: filterWidget,
      ));
    }
    bodyChilds.addAll(additionnalElement);
    bodyChilds.add(ListWidget(itemBuilder: itemBuilder, nbItem: nbItem));
    return Scaffold(
        appBar: const MyAppBar(),
        bottomNavigationBar: const MyBottomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: bodyChilds,
          ),
        ));
  }
}
