import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:martin_app/app/share_widget/rounded_botton.dart';
import 'package:martin_app/app/share_widget/social_media_icon_button.dart';
import 'package:martin_app/app/utils/style/app_decoraction.dart';

import '../controllers/login_controller.dart';
import 'widget/text_field.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: Get.width * .05),
              SvgPicture.asset(
                'assets/icons/login.svg',
                height: Get.height * .25,
              ),
              SizedBox(height: Get.width * .05),
              Text(
                'LOG IN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: Get.width * .06),
              InputFieldText(
                child: TextField(
                  onChanged: (val) => print(val),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white),
                    hintText: 'Your Email Address',
                    border: InputBorder.none,
                  ),
                ),
              ),
              InputFieldText(
                child: TextField(
                  onChanged: (val) => print(val),
                  obscureText: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      color: Colors.white,
                      onPressed: () => print('click'),
                    ),
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Your Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.03),
              RoundedButton(
                title: 'LOGIN',
                press: () => print('login'),
                color: AppColor.kPrimaryColor,
                txtColor: Colors.white,
              ),
              SizedBox(height: Get.height * .03),
              GetBuilder<LoginController>(builder: (_controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialMediaIconButton(
                      imgUrl: 'assets/icons/google.png',
                      onTap: _controller.signInWithGoogle,
                    ),
                    SocialMediaIconButton(
                        imgUrl: 'assets/icons/facebook.png',
                        onTap: _controller.signInWithFacebook),
                    SocialMediaIconButton(
                      imgUrl: 'assets/icons/apple.png',
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
