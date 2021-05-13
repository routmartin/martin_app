import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:martin_app/app/modules/topic/views/widget/topic_card.dart';
import '../controllers/topic_controller.dart';

class TopicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TopicController>(
        init: TopicController(),
        builder: (_controller) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _controller.topicList.length,
            itemBuilder: (ctx, index) {
              return TopicCard(data: _controller.topicList[index]);
            },
          );
        },
      ),
    );
  }
}
