import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/tinder_user.dart';
import '../utils/card_provider.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  final TinderUser user;
  const DetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(defaultBorderRadius),
                  bottomRight: Radius.circular(defaultBorderRadius)),
              child: Image.asset(user.photoUrl,
                  fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.name} , ${user.age}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: defaultPadding * 0.2,
                      ),
                      Text(
                        '${user.distanceInKM} km from from you',
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        user.bio,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: ActionButtonsWidget(onDisLike: () {
                    final provider =
                        Provider.of<CardProvider>(context, listen: false);
                    provider.dislike();
                    Navigator.of(context).pop();
                  }, onSuperLike: () {
                    final provider =
                        Provider.of<CardProvider>(context, listen: false);
                    provider.superlike();
                    Navigator.of(context).pop();
                  }, onLike: () {
                    final provider =
                        Provider.of<CardProvider>(context, listen: false);
                    provider.like();
                    Navigator.of(context).pop();
                  })))
        ],
      ),
    );
  }
}
