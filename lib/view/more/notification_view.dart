import 'package:cookinapp_01/view/more/my_order_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';


class NotificationsView {
  //const NotificationsView({super.key});

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true

    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("user granted permission");
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print("user granted provisional permission");
    }else{
      print("user denied permission");
    }
  }

}
