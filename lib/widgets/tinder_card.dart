import 'package:flutter/material.dart';
import 'package:flutter_tinder_demo/model/tinder_user.dart';

import '../utils/constants.dart';
import '../widgets/widgets.dart';

class TinderCardWidget extends StatelessWidget {
  final TinderUser user;
  final int depth;
  final BoxConstraints constraints;
  final bool isFront;
  const TinderCardWidget(
      {Key? key,
      required this.user,
      required this.depth,
      required this.isFront,
      required this.constraints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFront
        ? FrontCardWidget(user: user, constraints: constraints, depth: depth)
        : PhotoCardWidget(
            user: user,
            depth: depth,
            width: constraints.maxWidth * cardWidthPercent,
            height: constraints.maxHeight * cardHeightPecent,
          );
  }
}
