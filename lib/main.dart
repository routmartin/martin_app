import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:martin_app/app/modules/main/bindings/main_binding.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/DI.dart';
import 'app/utils/style/app_decoraction.dart';

void main() {
  DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: MainBinding(),
      theme: ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        accentColor: Color(0xff272727),
        scaffoldBackgroundColor: AppColor.darkBackGround,
        fontFamily: 'Nunito',
      ),
    ),
  );
}
