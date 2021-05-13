import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/core/api_base_helper.dart';

class DependencyInjection {
  static void init() {
    // App

    Get.put<Dio>(Dio());
    Get.put<ApiBaseHelper>(ApiBaseHelper());

    //Api

    //Service

    // Local_Data
  }
}
