import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function press;
  final Color color;
  final Color txtColor;
  RoundedButton({this.title, this.press, this.color, this.txtColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: press,
          color: color,
          child: Text(
            title,
            style: TextStyle(color: txtColor),
          ),
        ),
      ),
    );
  }
}
