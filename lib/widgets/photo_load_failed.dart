import 'package:flutter/material.dart';

class PhotoLoadFailed extends StatelessWidget {
  const PhotoLoadFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          Text('Failed to load photo')
        ],
      ),
    );
  }
}
