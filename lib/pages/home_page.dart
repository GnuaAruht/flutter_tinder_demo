import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/card_provider.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: const Icon(
          CupertinoIcons.person_fill,
          color: Colors.white54,
          size: 32,
        ),
        title: const Icon(
          Icons.local_fire_department_sharp,
          color: Colors.redAccent,
          size: defaultIconSize,
        ),
        actions: const [
          Icon(
            CupertinoIcons.chat_bubble_2_fill,
            color: Colors.white54,
            size: 32,
          ),
          SizedBox(
            width: defaultPadding,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 0.4, vertical: defaultPadding),
              child: TinderCardList(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: ActionButtonsWidget(onDisLike: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.dislike();
              }, onSuperLike: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.superlike();
              }, onLike: () {
                final provider =
                    Provider.of<CardProvider>(context, listen: false);
                provider.like();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
