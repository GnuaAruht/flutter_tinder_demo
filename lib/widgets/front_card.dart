import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/tinder_user.dart';
import '../pages/detail_page.dart';
import '../utils/card_provider.dart';
import '../utils/constants.dart';
import '../utils/fade_page_route.dart';
import '../widgets/photo_card.dart';

class FrontCardWidget extends StatelessWidget {
  final TinderUser user;
  final BoxConstraints constraints;
  final int depth;
  const FrontCardWidget(
      {Key? key,
      required this.user,
      required this.constraints,
      required this.depth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(FadePageRoute(
            child: DetailPage(
          user: user,
        )));
      },
      onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.endPosition();
      },
      child: Builder(builder: (context) {
        final provider = Provider.of<CardProvider>(context);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;
        final angle = provider.angle * pi / 180;
        final center = constraints.smallest.center(Offset.zero);

        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
            duration: Duration(milliseconds: milliseconds),
            transform: rotatedMatrix..translate(position.dx, position.dy),
            child: PhotoCardWidget(
              user: user,
              depth: depth,
              width: constraints.maxWidth * cardWidthPercent,
              height: constraints.maxHeight * cardHeightPecent,
            ));
      }),
    );
  }
}
