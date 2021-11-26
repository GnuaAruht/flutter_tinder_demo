import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_demo/model/tinder_user.dart';
import 'package:flutter_tinder_demo/widgets/photo_load_failed.dart';
import '../utils/constants.dart';

class PhotoCardWidget extends StatelessWidget {
  final TinderUser user;
  final int depth;
  final double width, height;
  const PhotoCardWidget(
      {Key? key,
      required this.user,
      required this.depth,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, perspective)
        ..translate(0.0, depth * depthFactor, depth * depthFactor),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (_, __) {
                    return Container(
                      color: Colors.redAccent,
                    );
                  },
                  errorWidget: (context, _, __) {
                    return const PhotoLoadFailed();
                  },
                  imageUrl: user.photoUrl),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding, vertical: defaultPadding),
                      height: height * 0.18, // 18 percent of the card height
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.88),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.name}, ${user.age}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            '${user.distanceInKM} km near you',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
