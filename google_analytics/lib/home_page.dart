import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_analytics/common_function.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAnalytics instance;
  late FirebaseFirestore firebaseFirestoreInstance;

  @override
  void initState() {
    firebaseFirestoreInstance = FirebaseFirestore.instance;
    "FirebaseStoreInstance: $firebaseFirestoreInstance".logIt;

    fireInit();
    super.initState();
  }

  Future<void> addData() async {
    try {
      CollectionReference user = firebaseFirestoreInstance.collection('users');

      return await user
          .add({
            "name": "John Doe",
            "email": "johndoe@example.com",
            "age": 30,
          })
          .then(
            (value) => "User added".logIt,
          )
          .catchError(
            (error) => "Failed to add  user: $error".logIt,
          );
    } catch (e) {
      "Error: $e".logIt;
    }
  }

  Future fireInit() async {
    instance = FirebaseAnalytics.instance;
    "Firebase instance:  $instance".logIt;
    await instance.logBeginCheckout(
      value: 10.0,
      currency: 'USD',
      items: [
        AnalyticsEventItem(
          itemName: 'Socks',
          itemId: 'xjw73ndnw',
          price: 10.0,
        ),
      ],
      coupon: '10PERCENTOFF',
    );
    await FirebaseAnalytics.instance.setCurrentScreen(
      screenName: 'HomePage',
    );
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    "DidUpdateWidget called".logIt;
    super.didUpdateWidget(const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Analytics"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                addData();
              },
              child: const Text("Save Data to Firestore")),
        ),
      ),
    );
  }
}
