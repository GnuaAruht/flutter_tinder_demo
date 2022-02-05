import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/card_provider.dart';
import '../utils/constants.dart';
import 'circle_button.dart';

class ActionButtonsWidget extends StatelessWidget {
  final VoidCallback onDisLike;
  final VoidCallback onSuperLike;
  final VoidCallback onLike;
  const ActionButtonsWidget({
    Key? key,
    required this.onDisLike,
    required this.onSuperLike,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);

    final cardStatus = provider.getStatus();
    final isDislike = cardStatus == CardStatus.dislike;
    final isLike = cardStatus == CardStatus.like;
    final isSuperlike = cardStatus == CardStatus.superlike;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleButtonWidget(
          onTap: onDisLike,
          icon: CupertinoIcons.clear,
          iconColor: Colors.red,
          contentPadding: defaultPadding * 1.2,
          isPressed: isDislike,
        ),
        CircleButtonWidget(
          onTap: onSuperLike,
          icon: CupertinoIcons.star_fill,
          iconColor: Colors.lightBlueAccent,
          isPressed: isSuperlike,
        ),
        CircleButtonWidget(
          onTap: onLike,
          icon: CupertinoIcons.heart_fill,
          iconColor: Colors.greenAccent,
          contentPadding: defaultPadding * 1.2,
          isPressed: isLike,
        )
      ],
    );
  }
}
