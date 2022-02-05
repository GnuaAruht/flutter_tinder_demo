import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/tinder_user.dart';
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
      );
    });
  }
}
