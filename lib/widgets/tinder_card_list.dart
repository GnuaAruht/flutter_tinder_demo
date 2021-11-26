import 'package:flutter/material.dart';
import 'package:flutter_tinder_demo/model/tinder_user.dart';
import 'package:provider/provider.dart';

import '../utils/card_provider.dart';
import '../widgets/tinder_card.dart';

class TinderCardList extends StatefulWidget {
  const TinderCardList({
    Key? key,
  }) : super(key: key);

  @override
  State<TinderCardList> createState() => _TinderCardListState();
}

class _TinderCardListState extends State<TinderCardList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;
      Provider.of<CardProvider>(context, listen: false).setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<TinderUser> users = Provider.of<CardProvider>(context).users;

    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: List.generate(users.length, (index) {
          final user = users[index];
          return TinderCardWidget(
            user: user,
            depth: index,
            constraints: constraints,
            isFront: user == users.first,
          );
        }).reversed.toList(),
        // children: List.generate(colors.length, (index) {
        //   final color = colors[index];
        //   return colors.last == color
        //       ? TinderCard(
        //           color: color,
        //           depth: index,
        //           constraints: constraints,
        //         )
        //       : PhotoCard(
        //           color: color,
        //           depth: index,
        //           width: constraints.maxWidth * cardWidthPercent,
        //           height: constraints.maxHeight * cardHeightPecent,
        //         );
        // }),
      );
    });
  }
}
