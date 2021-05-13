import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';
import 'package:martin_app/app/utils/style/app_decoraction.dart';

import '../controllers/preview_controller.dart';

class PreviewView extends GetView<PreviewController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreviewController>(
      builder: (_controller) {
        return _controller.isLoading
            ? CenterIndicator()
            : Stack(
                children: <Widget>[
                  ImageFade(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    image: NetworkImage(_controller.previePhoto.urls.raw),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent event) {
                      if (event == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: .9,
                          valueColor: AlwaysStoppedAnimation(Colors.grey[200]),
                          value: event.expectedTotalBytes == null
                              ? 0.0
                              : event.cumulativeBytesLoaded /
                                  event.expectedTotalBytes,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Widget child,
                        dynamic exception) {
                      return Container(
                        color: Color(0xFF6F6D6A),
                        child: Center(
                          child: Icon(Icons.warning,
                              color: Colors.black26, size: 128.0),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    bottom: MediaQuery.of(context).size.height * .1,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 60,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            AppDecoration.shadowCard,
                          ],
                          color: Color(0xfff2f2f2).withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: MediaQuery.of(context).size.height * .1,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 60,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            AppDecoration.shadowCard,
                          ],
                          color: Color(0xfff2f2f2).withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Icon(
                          Icons.download_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }
}
