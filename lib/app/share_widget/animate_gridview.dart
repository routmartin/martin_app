import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:martin_app/app/model/photo.dart';

import 'center_indicator.dart';

class AnimateGridViewPhoto extends StatelessWidget {
  const AnimateGridViewPhoto({
    Key key,
    @required this.topicPhotoList,
    @required this.size,
  }) : super(key: key);

  final List<Photo> topicPhotoList;
  final Size size;

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
      itemCount: topicPhotoList.length,
      options: options,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: size.height / 1500,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0xff0E0F0E).withOpacity(0.22),
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: ImageFade(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    topicPhotoList[index].urls.small,
                  ),
                  placeholder: CenterIndicator(),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent event) {
                    if (event == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: event.expectedTotalBytes == null
                            ? 0.0
                            : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes,
                      ),
                    );
                  },
                  errorBuilder:
                      (BuildContext context, Widget child, dynamic exception) {
                    return Container(
                      color: Color(0xFF6F6D6A),
                      child: Center(
                        child: Icon(
                          Icons.warning,
                          color: Colors.black26,
                          size: 128.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
