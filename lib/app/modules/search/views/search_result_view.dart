import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/share_widget/animate_gridview.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';

import '../controllers/search_result_controller.dart';

class SearchResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchResultController>(builder: (_controller) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 50.0,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Theme.of(context).accentColor,
              ),
              child: Text(
                Get.arguments,
                style: GoogleFonts.montserrat(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15.0,
                  letterSpacing: .8,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: _controller.isLoading
              ? CenterIndicator()
              : AnimateGridViewPhoto(
                  topicPhotoList: _controller.photoList,
                  scrollController: _controller.scrollController,
                ),
          // child: CenterIndicator(),
        ),
      );
    });
  }
}
