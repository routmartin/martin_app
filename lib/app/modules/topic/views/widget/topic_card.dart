import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/model/topic.dart';
import 'package:martin_app/app/routes/app_pages.dart';

class TopicCard extends StatelessWidget {
  final Topic data;

  const TopicCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Get.height * .25,
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0xff0E0F0E).withOpacity(0.22),
                offset: Offset(0, 3),
              )
            ],
            image: DecorationImage(
              image: NetworkImage(data.previewPhotos[0].urls.small),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.6), BlendMode.darken),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: Get.height * .25,
          margin: EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Get.toNamed(Routes.TOPIC_DETAIL, arguments: [
                  data.id,
                  data.title,
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data.title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
