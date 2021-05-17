import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/modules/search/controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (controller) {
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
              textInputAction: TextInputAction.search,
              onSubmitted: (query) => controller.goToSearch(query),
              keyboardType: TextInputType.text,
              style: GoogleFonts.montserrat(
                color: Theme.of(context).primaryColor,
                fontSize: 15.0,
                letterSpacing: .8,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.none,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                hintText: "Looking for...",
                hintStyle: GoogleFonts.montserrat(
                  color: Theme.of(context).primaryColor,
                  fontSize: 15.0,
                  letterSpacing: .8,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.none,
                ),
                border: InputBorder.none,
                fillColor: Colors.black,
                suffixIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(0),
          itemCount: controller.historyCollection.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () => controller
                  .goToSearch(controller.historyCollection[index].title),
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(controller.historyCollection[index].title),
              ),
            );
          },
        ),
      );
    });
  }
}
