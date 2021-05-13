import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:martin_app/app/share_widget/custom_refresh_indicator.dart';

import '../controllers/explore_show_controller.dart';
import '../../../share_widget/photo_card.dart';

class ExploreShowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'The Best of "${Get.arguments[1]}"',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          GetBuilder<ExploreShowController>(
            builder: (controller) {
              return Expanded(
                child: CustomScrollView(
                  controller: controller.scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    CupertinoSliverRefreshControl(
                      builder: Platform.isIOS
                          ? buildAppleRefreshIndicator
                          : buildAndroidRefreshIndicator,
                      onRefresh: () async {
                        await controller.onRefresh();
                      },
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      sliver: SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        staggeredTileBuilder: (index) =>
                            StaggeredTile.count(1, index.isEven ? 1.8 : 1.2),
                        itemCount: controller.photoCollectionList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PhotoCard(
                            data: controller.photoCollectionList[index],
                          );
                        },
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          alignment: Alignment.center,
                          child: controller.loadingStatus == Status.noMore
                              ? Container()
                              : CircularProgressIndicator(
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
              );
            },
          )
        ],
      ),
    );
  }
}
