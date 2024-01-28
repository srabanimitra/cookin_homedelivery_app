import 'dart:math';

import 'package:cookinapp_01/view/more/my_order_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../common/color_extension.dart';


class NotificationsView {
  //const NotificationsView({super.key});

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  void requestNotificationPermission(BuildContext context, RemoteMessage message)async{}

  void initLocalNotifications()async{
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    //print(message.notification!.title.toString());
    //print(message.notification!.body.toString());

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings ,
    );
    
    await _flutterLocalNotificationsPlugin.initialize(
        initializationSetting,
      onDidReceiveNotificationResponse: (payload){

      }
    );

  }
  void FirebaseInit(){

    FirebaseMessaging.onMessage.listen((message){
      if(kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
      showNotification(message);
    });
  }
    Future<void> showNotification(RemoteMessage message)async{

    AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'Important Notification' ,
        importance:Importance.max
    );
     //Future.delayed(Duration.zero
     //);
    }
    Future<String> getDeviceToken()async{
  String? token = await messaging.getToken();
  return token!;
  }
  void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('refresh');
    });
  }
}
