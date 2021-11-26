import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double contentPadding;
  final bool isPressed;
  const CircleButtonWidget(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.iconColor,
      this.iconSize = defaultIconSize,
      required this.isPressed,
      this.contentPadding = defaultPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(contentPadding),
        primary: isPressed ? Colors.white60 : Colors.white12,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      onPressed: onTap,
    );
  }
}
