import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notification/notification_screen.dart';
import 'package:push_notification/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  if (kDebugMode) {
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");
    print("Payload: ${message.data}");
  }
}

class FirebaseAPI {
  final firebaseMessaging = FirebaseMessaging.instance;

  final androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notification",
      description: "This channel is used for important notification",
      importance: Importance.defaultImportance);

  final localNotification = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState!.pushNamed(
      NotificationScreen.route,
      arguments: message,
    );
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(
          handleMessage,
        );
    FirebaseMessaging.onMessageOpenedApp.listen(
      handleMessage,
    );
    FirebaseMessaging.onBackgroundMessage(
      handleBackgroundMessage,
    );
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidChannel.id,
              androidChannel.name,
              channelDescription: androidChannel.description,
              icon: '@drawable/ic_launcher',
            ),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  Future initLocalNotification() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await localNotification.initialize(settings,
        onDidReceiveBackgroundNotificationResponse: (payload) {
      // final message = RemoteMessage.fromMap(jsonDecode(payload));
      // handleMessage(message);
    });
  }

  Future<void> initNotification() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    if (kDebugMode) {
      print("Token: $fcmToken");
    }
    initPushNotification();
  }
}
