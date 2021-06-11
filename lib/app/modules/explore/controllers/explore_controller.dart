import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:martin_app/app/model/collection.dart';
import 'package:martin_app/app/modules/explore/api/explore_api.dart';

class ExploreController extends GetxController {
  final _exploreApi = Get.find<ExploreApi>();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  List<Collection> collectionList = [];

  int _collectionPage = 1;
  bool isCollectionLoading = true;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    initPermissionFCM();
    getInitMessage();
  }

  @override
  void onReady() {
    super.onReady();
    _fetchCollectionData();
  }

  _fetchCollectionData() {
    _exploreApi.fetchExploreCollection(page: _collectionPage).then((data) {
      collectionList.addAll(data);
      isCollectionLoading = false;
      _collectionPage++;
      update();
    });
  }

  onRefresh() {
    _collectionPage = 1;
    collectionList.clear();
    _fetchCollectionData();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _fetchCollectionData();
    }
  }

  initPermissionFCM() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  getInitMessage() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('onMessage: ${message.notification.title}');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      await flutterLocalNotificationsPlugin.show(
        0,
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: 'item x',
      );
      if (notification != null && android != null) {}
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification;
      await flutterLocalNotificationsPlugin.show(
        0,
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: 'item x',
      );
    });
  }
}
