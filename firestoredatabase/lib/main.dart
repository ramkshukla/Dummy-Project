import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  List<UserData> userdata = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> uploadingData(
    String productName,
    String productPrice,
    String section,
  ) async {
    await FirebaseFirestore.instance.collection("student").add(
      {
        'id': productName,
        'name': productPrice,
        "section": section,
      },
    ).then((value) => print("Save Data"));
  }

  Future<QuerySnapshot> getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("student")
        .get()
        .whenComplete(
          () => const SnackBar(
            content: Text(
              "Data fetch successfully",
            ),
            backgroundColor: Colors.green,
          ),
        );

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      // userdata.add(UserData(id: data["id"], name: data["name"]));
      print(data["id"]);
      print(data["name"]); // String name = data["name"];
      // int id = data["id"];
    }
    print("UserData : $userdata");
    // print(querySnapshot.docs[0].data());
    // QuerySnapshot querySnapshot =
    //     Firestore.instance.collection("student").getDocuments();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: const Text("Get Data"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uploadingData("2", "Ram Kumar", "B");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UserData {
  String? name;
  int? id;
  UserData({this.name, this.id});

  toJson() {
    return {
      "name": name,
      "id": id,
    };
  }
}
