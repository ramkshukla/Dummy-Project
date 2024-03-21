import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/firebase_api.dart';
import 'package:push_notification/home_screen.dart';
import 'package:push_notification/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAPI().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen(),
      },
    );
  }
}
