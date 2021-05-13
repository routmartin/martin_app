import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martin_app/app/model/topic.dart';

class TopicCard extends StatelessWidget {
  final Topic data;

  const TopicCard({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
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
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.7), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.title,
            overflow: TextOverflow.ellipsis,
            style:
                GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 13,
                letterSpacing: .9,
                height: 1.8,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Container(
            width: 70,
            height: 45,
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: Colors.black,
                fontSize: 13,
                letterSpacing: .9,
                height: 1.8,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
