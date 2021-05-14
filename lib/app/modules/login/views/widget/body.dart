import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  final Widget child;
  LoginBody(this.child);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              height: size.height * .2,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              height: size.height * .18,
            ),
          ),
          child
        ],
      ),
    );
  }
}
