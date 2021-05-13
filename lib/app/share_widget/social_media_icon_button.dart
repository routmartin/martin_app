import 'package:flutter/material.dart';

class SocialMediaIconButton extends StatelessWidget {
  final String title;
  final String imgUrl;
  final Function onTap;

  const SocialMediaIconButton(
      {Key key, this.title = 'title', this.imgUrl, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
