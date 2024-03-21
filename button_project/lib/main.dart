import 'package:another_flushbar/flushbar.dart';
import 'package:button_project/module/song_listing/view/song_listing_screen.dart';
import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const SongListing()

        //  const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Text(
              "Flutter",
              style: TextStyle(fontSize: 10.sp),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            const CurvedCircularProgressIndicator(
              value: 0.5,
              strokeWidth: 12,
              animationDuration: Duration(seconds: 1),
              backgroundColor: Color(0xFFFFFFCD),
              color: Colors.blue,
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: DottedBorder(
                color: Colors.orangeAccent,
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Dotted Border",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Positioned(
              top: 100,
              left: 100,
              child: ElevatedButton(
                onPressed: () {
                  Flushbar(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    borderRadius: BorderRadius.circular(10),
                    titleText: const Row(
                      children: [
                        Icon(Icons.mic),
                        Text("Title"),
                      ],
                    ),
                    backgroundColor: Colors.red,
                    message: "This is a flushbar.",
                    duration: const Duration(seconds: 2),
                  ).show(context);
                },
                child: const Text("Show flushbar"),
              ),
            ),
            Container(
              color: Colors.red,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              child: Text(
                'This is a text widget with padding.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            Container(
              color: Colors.blue,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              child: Text(
                'This is a text widget with padding.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Home(
                      name: "Ram Kumar Shukla",
                      rollNumber: "2",
                      section: "A",
                    ),
                  ),
                );
              },
              child: const Text("Press Me"),
            )
          ],
        ),
      ),
    );
  }
}
