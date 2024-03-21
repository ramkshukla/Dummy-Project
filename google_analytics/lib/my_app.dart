import 'package:flutter/material.dart';
import 'package:google_analytics/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
