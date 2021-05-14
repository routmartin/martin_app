import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/share_widget/photo_card.dart';

import 'center_indicator.dart';

class AnimateGridViewPhoto extends StatelessWidget {
  const AnimateGridViewPhoto({
    Key key,
    @required this.topicPhotoList,
    @required this.scrollController,
  }) : super(key: key);

  final List<Photo> topicPhotoList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    LiveOptions options = LiveOptions(
      // Start animation after (default zero)
      // delay: Duration(milliseconds: 500),

      // Show each item through (default 250)
      showItemInterval: Duration(milliseconds: 80),

      // Animation duration (default 250)
      showItemDuration: Duration(milliseconds: 120),

      // Animations starts at 0.05 visible
      // item fraction in sight (default 0.025)
      visibleFraction: 0.02,

      // Repeat the animation of the appearance
      // when scrolling in the opposite direction (default false)
      // To get the effect as in a showcase for ListView, set true
      reAnimateOnVisibility: false,
    );

    return LiveGrid.options(
      controller: scrollController,
      itemCount: topicPhotoList.length,
      options: options,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: Get.height / 1300,
      ),
      padding: EdgeInsets.all(10),
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          // And slide transition
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            // Paste you Widget
            child: PhotoCard(data: topicPhotoList[index]),
          ),
        );
      },
    );
  }
}
