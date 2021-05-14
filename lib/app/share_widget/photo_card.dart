import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_fade/image_fade.dart';
import 'package:martin_app/app/model/photo.dart';
import 'package:martin_app/app/routes/app_pages.dart';
import 'package:martin_app/app/utils/style/app_decoraction.dart';

class PhotoCard extends StatelessWidget {
  final Photo data;

  const PhotoCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.PREVIEW, arguments: [data.id]),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 15,
              color: Color(0xff1A1515).withOpacity(0.12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ImageFade(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            image: NetworkImage(data.urls.small),
            placeholder: Container(
              color: AppColor.darkBackGround,
            ),
            errorBuilder:
                (BuildContext context, Widget child, dynamic exception) {
              return Container(
                color: Color(0xFF6F6D6A),
                child: Center(
                  child: Icon(
                    Icons.warning,
                    color: Colors.black26,
                    size: 128.0,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
