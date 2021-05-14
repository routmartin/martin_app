// import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ApiBaseHelper {
  static Dio createDio() {
    return Dio()
      ..options.baseUrl = "https://api.unsplash.com/"
      ..options.connectTimeout = 5000
      ..options.receiveTimeout = 5000
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'}
      ..options.queryParameters = {
        "client_id": "7O8VnUVu9MaQZZSMYIhvvxankUEfYNfjGiL3EkHfVxE"
      };
  }

  static Dio addInterceptorsWithHeader(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options) async {
            print('Endpoint-> ${options.path}');
            print('queryParameters-> ${options.queryParameters}');
            return options;
          },
          onError: (error) {},
          onResponse: (response) {},
        ),
      );
  }

  static Dio addInterceptorsNoHeader(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options) async {
            return options;
          },
          onError: (error) {},
          onResponse: (response) {},
        ),
      );
  }

  final _apiBasewithHeader = addInterceptorsWithHeader(createDio());
  final _apiBaseNoHeader = addInterceptorsNoHeader(createDio());

  Future getMethodWithHeader(String endPoint,
      {Map<String, dynamic> body}) async {
    try {
      Response response =
          await _apiBasewithHeader.get(endPoint, queryParameters: body);
      return response;
    } on DioError catch (e) {
      return _onHandleDioError(e);
    } on TypeError catch (e) {
      return _onHandleTypeError(e);
    } on SocketException {
      return throw 'No Intenet Connection';
    } catch (e) {
      return throw e.toString();
    }
  }

  Future postMethodWithHeader(String endPoint,
      {Map<String, dynamic> body}) async {
    try {
      Response response = await _apiBasewithHeader.post(endPoint, data: body);
      return response;
    } on DioError catch (e) {
      return _onHandleDioError(e);
    } on TypeError catch (e) {
      return _onHandleTypeError(e);
    } catch (e) {
      return throw e.toString();
    }
  }

  Future getMethodNoHeader(String endPoint, {Map<String, dynamic> body}) async {
    try {
      Response response =
          await _apiBaseNoHeader.get(endPoint, queryParameters: body);
      return response;
    } on DioError catch (e) {
      return _onHandleDioError(e);
    } on TypeError catch (e) {
      return _onHandleTypeError(e);
    } catch (e) {
      return throw e.toString();
    }
  }

  Future postMethodNoHeader(String endPoint,
      {Map<String, dynamic> body}) async {
    try {
      Response response = await _apiBaseNoHeader.post(endPoint, data: body);
      return response;
    } on DioError catch (e) {
      return _onHandleDioError(e);
    } on TypeError catch (e) {
      return _onHandleTypeError(e);
    } catch (e) {
      return throw e.toString();
    }
  }

  /// to handle type error
  dynamic _onHandleTypeError(exc) {
    throw exc;
  }

  /// to handle error base on dio error
  dynamic _onHandleDioError(exc) {
    if (exc.error is SocketException ||
        exc.type == DioErrorType.CONNECT_TIMEOUT) {
      Get.snackbar(
        'No Internet Connection',
        'Please check your connection first',
        snackPosition: SnackPosition.TOP,
      );
      return throw "No Internet Connection";
    } else if (exc.type == DioErrorType.RESPONSE) {
      switch (exc.response.statusCode) {
        case 400:
          throw "Invalid Request: ${exc.response.data}";
        case 401:
        case 404:
        case 403:
          throw "Invalid Request: ${exc.response.data}";
        case 500:
        default:
          return throw 'Error occured while Communication with Server with StatusCode : ${exc.response.statusCode}';
      }
    } else {
      throw "An unexpected error occur!";
    }
  }

  /// to decode in background service
  // _parseAndDecode(String response) {
  //   return jsonDecode(response);
  // }

  // _parseJson(String response) {
  //   return compute(_parseAndDecode, response);
  // }
}
