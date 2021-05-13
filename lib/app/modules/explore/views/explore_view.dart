import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/modules/explore/views/widget/explore_card.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';
import 'package:martin_app/app/share_widget/custom_refresh_indicator.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
      init: ExploreController(),
      builder: (controller) {
        return Scaffold(
          body: controller.isCollectionLoading
              ? CenterIndicator()
              : SafeArea(
                  child: Container(
                    height: Get.height,
                    width: double.infinity,
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      controller: controller.scrollController,
                      slivers: [
                        CupertinoSliverRefreshControl(
                          builder: Platform.isIOS
                              ? buildAppleRefreshIndicator
                              : buildAndroidRefreshIndicator,
                          onRefresh: () async {
                            await controller.onRefresh();
                          },
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (ctx, index) {
                              return ExploreCard(
                                collection: controller.collectionList[index],
                              );
                            },
                            childCount: controller.collectionList.length,
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          sliver: SliverToBoxAdapter(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.grey[200],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
