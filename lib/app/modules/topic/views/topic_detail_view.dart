import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/modules/topic/controllers/topic_detail_controller.dart';
import 'package:martin_app/app/share_widget/animate_gridview.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';
import 'package:martin_app/app/utils/style/app_decoraction.dart';

class TopicDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: AppColor.darkBackGround,
        elevation: 10,
        centerTitle: true,
        title: Text(
          Get.arguments[1],
          style: GoogleFonts.lato(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: Get.height,
        child: GetBuilder<TopicDetailController>(
          builder: (_controller) {
            return _controller.isLoading
                ? CenterIndicator()
                : AnimateGridViewPhoto(
                    scrollController: _controller.scrollController,
                    topicPhotoList: _controller.photoList,
                  );
          },
        ),
      ),
    );
  }
}
