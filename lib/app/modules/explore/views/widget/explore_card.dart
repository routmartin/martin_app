import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';
import 'package:image_fade/image_fade.dart';
import 'package:martin_app/app/model/collection.dart';
import 'package:martin_app/app/routes/app_pages.dart';
import 'package:martin_app/app/share_widget/center_indicator.dart';

class ExploreCard extends StatelessWidget {
  final Collection collection;

  const ExploreCard({Key key, this.collection}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 220,
                child: Text(
                  'The Best of " ${collection.title} "',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.EXPLORE_SHOW, arguments: [
                      collection.id,
                      collection.title,
                      collection.totalPhoto
                    ]),
                    splashColor:
                        Theme.of(context).primaryColor.withOpacity(0.3),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Text(
                        'See all'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          LimitedBox(
            maxHeight: 600,
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              staggeredTileBuilder: (index) =>
                  StaggeredTile.count(1, index.isEven ? 1.8 : 1.2),
              itemCount: collection.previewPhotos.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 15,
                        color: Color(0xff1A1515).withOpacity(0.12),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImageFade(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        collection.previewPhotos[index].urls.small,
                      ),
                      placeholder: CenterIndicator(),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent event) {
                        if (event == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: event.expectedTotalBytes == null
                                ? 0.0
                                : event.cumulativeBytesLoaded /
                                    event.expectedTotalBytes,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Widget child,
                          dynamic exception) {
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
