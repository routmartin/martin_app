import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/modules/topic/views/widget/topic_card.dart';
import 'package:martin_app/app/routes/app_pages.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';
import 'package:martin_app/app/utils/style/app_decoraction.dart';
import '../controllers/topic_controller.dart';

class TopicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.darkBackGround,
        elevation: 10,
        title: Text(
          'Topic',
          style: GoogleFonts.lato(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_sharp,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => Get.toNamed(Routes.SEARCH),
          )
        ],
      ),
      body: GetBuilder<TopicController>(
        init: TopicController(),
        builder: (_controller) {
          return _controller.isLoading
              ? CenterIndicator()
              : ListView.builder(
                  itemCount: _controller.topicList.length,
                  itemBuilder: (ctx, index) {
                    return TopicCard(data: _controller.topicList[index]);
                  });
        },
      ),
    );
  }
}
