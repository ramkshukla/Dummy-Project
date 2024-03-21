import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view/common_component.dart';
import 'package:staggered_grid_view/home_page.dart';
import 'package:staggered_grid_view/theme_config.dart';

Future<void> main() async {
  // "Firebaase Initialized Starts".logIt;
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());

  "Firebaase Initialized End".logIt;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final ScrollController _scrollController = ScrollController();
  final List<int> _data = List.generate(20, (index) => index);
  final StreamController<String> controller = StreamController<String>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    _scrollController.addListener(loadMoreItems);
    // addUser("Ram", "ramkumar", 20);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  loadMoreItems() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      "Scroll Controller : $_scrollController".logIt;
      setState(() {
        _data.addAll(List.generate(10, (index) => index).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.home),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String>(
                stream: controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data ?? "");
                  } else {
                    return const Text("No Data");
                  }
                },
              ),
              TextField(
                controller: textEditingController,
              ),
              ElevatedButton(
                onPressed: () {
                  print(textEditingController.text);
                  controller.add(textEditingController.text);
                },
                child: Text("Add"),
              )
            ],
          ),
        )

        // ListView.builder(
        //   controller: _scrollController,
        //   itemCount: _data.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text("Item $_data[index]"),
        //     );
        //   },
        // ),
        );
  }
}
