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
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Text('Something went wrong'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
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
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
