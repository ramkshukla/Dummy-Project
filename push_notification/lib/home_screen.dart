import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/common_function.dart';
import 'package:push_notification/redeemUI.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    "====> This is log <======".logIt;
  }

  @override
  void initState() {
    firebaseInit();
    super.initState();
  }

  void firebaseInit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    "Notification Setting: ${settings.authorizationStatus}".logIt;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      "Get the message while in the foreground".logIt;

      "Message Data: $message".logIt;
      if (message.notification != null) {
        "Message also contained a notification: ${message.notification}".logIt;
      }
    });

    'User granted permission: ${settings.authorizationStatus}'.logIt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Redeem(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
