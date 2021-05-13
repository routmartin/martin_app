import 'package:flutter/material.dart';

class AppColor {
  static Color lightbackGroundColor = Color(0xffF4F4F7);
  static Color darkBackGround = Color(0xff121212);
}

class AppTextStyle {
  static TextStyle txtHeader = TextStyle(
    fontSize: 18,
    fontFamily: 'Nunito',
    color: Colors.black,
    fontWeight: FontWeight.w900,
  );
}

class AppDecoration {
  static BoxShadow shadowCard = BoxShadow(
    offset: Offset(1, 3),
    blurRadius: 10,
    color: Color(0xff1A1515).withOpacity(0.2),
  );
}

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    accentColor: Color(0xff272727),
    scaffoldBackgroundColor: AppColor.darkBackGround,
    fontFamily: 'Nunito',
  );
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,
    accentColor: Color(0xffFFFFFF),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.lightbackGroundColor,
    fontFamily: 'Nunito',
  );
}
