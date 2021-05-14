import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/share_widget/animate_gridview.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';

import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (_controller) {
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
          title: Container(
            height: 50.0,
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Theme.of(context).accentColor,
            ),
            child: TextField(
              autofocus: true,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.none,
              ),
              onChanged: (query) => _controller.query = query,
              autocorrect: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                hintText: "Looking for...",
                hintStyle: GoogleFonts.montserrat(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.0,
                  letterSpacing: .8,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
                ),
                border: InputBorder.none,
                fillColor: Colors.black,
                suffixIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                      onTap: () {
                        if (_controller.query.isNotEmpty &&
                            _controller.query.length > 0) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus &&
                              currentFocus.focusedChild != null) {
                            FocusManager.instance.primaryFocus.unfocus();
                          }
                          _controller.searchPhoto();
                        } else {
                          Get.snackbar('Please Search Something',
                              'Input the word you want to search on Searchbox');
                        }
                      },
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _controller.photoList.length > 0
            ? Container(
                width: double.infinity,
                child: _controller.isLoading
                    ? CenterIndicator()
                    : AnimateGridViewPhoto(
                        topicPhotoList: _controller.photoList,
                        scrollController: _controller.scrollController,
                      ),
                // child: CenterIndicator(),
              )
            : Container(),
      );
    });
  }
}
