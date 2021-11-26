import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget child;

  FadePageRoute({required this.child})
      : super(
            transitionDuration:
                const Duration(milliseconds: defaultRouteMilliSeconds),
            reverseTransitionDuration:
                const Duration(milliseconds: defaultRouteMilliSeconds),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
