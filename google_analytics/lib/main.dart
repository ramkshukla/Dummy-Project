import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_analytics/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
