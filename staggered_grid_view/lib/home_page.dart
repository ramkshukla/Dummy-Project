import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view/common_component.dart';
import 'package:staggered_grid_view/theme_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Dio dio;
  @override
  void initState() {
     apiCall();
    fetchUserData();
    super.initState();
   
  }

  Future<void> apiCall() async {
    try {
      Response response = await dio.get("https://api.example.com/items");
      if (response.statusCode == 200) {
        var data = response.data;
        "Response Data: $data".logIt;
      }
    } catch (e) {
      e.toString().logIt;
    }

    // return response;
  }

  Future<void> addUser(String name, String email, int age) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    "users".logIt;
    return users
        .add({
          'name': name,
          'email': email,
          'age': age,
        })
        .then((value) => "User added successfully!".logIt)
        .catchError((error) => "Failed to add user: $error".logIt);
  }

  Future<void> fetchUserData() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.get().then(
      (QuerySnapshot querySnapshot) {
        for (var element in querySnapshot.docs) {
          "${element.data()}".logIt;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home Page",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppTheme.primaryColorLight,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ExpandableWidget(
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Risus ultricies tristique nulla aliquet enim tortor at. Integer quis auctor elit sed vulputate mi sit amet mauris. Turpis nunc eget lorem dolor sed. Leo vel fringilla est ullamcorper eget. Est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Mattis vulputate enim nulla aliquet porttitor lacus luctus. Elit at imperdiet dui accumsan sit amet nulla. Venenatis a condimentum vitae sapien pellentesque habitant morbi. Varius duis at consectetur lorem donec massa. Nunc sed id semper risus in hendrerit. Porta lorem mollis aliquam ut porttitor leo. Tristique magna sit amet purus gravida quis blandit. At in tellus integer feugiat scelerisque. Scelerisque felis imperdiet proin fermentum leo vel orci porta. Viverra justo nec ultrices dui sapien eget. Nunc eget lorem dolor sed viverra ipsum nunc. Id consectetur purus ut faucibus pulvinar elementum integer. Quam adipiscing vitae proin sagittis nisl rhoncus mattis. Consequat nisl vel pretium lectus quam id leo in. At erat pellentesque adipiscing commodo elit at imperdiet dui. Nam at lectus urna duis. Semper risus in hendrerit gravida rutrum quisque non tellus orci. Vel turpis nunc eget lorem dolor sed. Amet mattis vulputate enim nulla aliquet. At varius vel pharetra vel turpis. Massa tincidunt dui ut ornare lectus sit amet. Vitae turpis massa sed elementum tempus egestas sed sed risus. Hac habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Non odio euismod lacinia at quis risus. Feugiat sed lectus vestibulum mattis ullamcorper. Tellus in metus vulputate eu scelerisque felis imperdiet proin fermentum. Amet consectetur adipiscing elit ut aliquam purus sit amet luctus. Sit amet risus nullam eget felis eget nunc. Egestas purus viverra accumsan in nisl. Tincidunt praesent semper feugiat nibh sed pulvinar proin. Rhoncus aenean vel elit scelerisque mauris. Nulla facilisi morbi tempus iaculis urna id. Imperdiet nulla malesuada pellentesque elit eget. Aliquam faucibus purus in massa tempor nec. Pulvinar etiam non quam lacus. Aliquam sem et tortor consequat id. Mi quis hendrerit dolor magna eget est lorem. Congue mauris rhoncus aenean vel elit. Tellus in metus vulputate eu scelerisque felis imperdiet proin. A diam sollicitudin tempor id eu nisl. Id aliquet risus feugiat in. Semper eget duis at tellus at urna. Rutrum tellus pellentesque eu tincidunt tortor aliquam. Sit amet volutpat consequat mauris nunc congue nisi vitae. Nisi est sit amet facilisis magna. In mollis nunc sed id semper. Quis ipsum suspendisse ultrices gravida dictum fusce ut. Ut pharetra sit amet aliquam id diam maecenas ultricies mi. Eu mi bibendum neque egestas congue. Quam quisque id diam vel quam elementum. Sit amet est placerat in egestas erat imperdiet sed euismod. Eu facilisis sed odio morbi. Rhoncus dolor purus non enim praesent elementum facilisis leo. Gravida arcu ac tortor dignissim convallis aenean. Sapien nec sagittis aliquam malesuada bibendum arcu vitae elementum. Nunc sed blandit libero volutpat. Elementum facilisis leo vel fringilla est ullamcorper eget.",
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class ExpandableWidget extends StatelessWidget {
  final String content;
  ExpandableWidget({
    super.key,
    required this.content,
  });

  ValueNotifier<bool> expanded = ValueNotifier(false);
  final int maxLinesToShow = 1;

  @override
  Widget build(BuildContext context) {
    final TextSpan textSpan = TextSpan(
      text: content,
      style: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 11.0,
        color: Colors.black,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: expanded.value ? null : maxLinesToShow,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: MediaQuery.of(context).size.width,
    );

    final int numberOfLines = textPainter.computeLineMetrics().length;

    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, values, _) {
        "=====>Check1".logIt;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (!expanded.value && numberOfLines >= maxLinesToShow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        maxLines: maxLinesToShow,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11.0,
                          color: Colors.black,
                        ),
                      ),
                      SeeMoreLessWidget(
                        textData: 'See More',
                        type: 1,
                        section: 1,
                        onSeeMoreLessTap: () {
                          expanded.value = true;
                        },
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 11.0,
                          color: Colors.black,
                        ),
                      ),
                      if (expanded.value && numberOfLines >= maxLinesToShow)
                        SeeMoreLessWidget(
                          textData: 'See Less',
                          type: 2,
                          section: 1,
                          onSeeMoreLessTap: () {
                            expanded.value = false;
                          },
                        ),
                    ],
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class SeeMoreLessWidget extends StatelessWidget {
  final String? textData;
  final int? type;
  final Function? onSeeMoreLessTap;
  final int? section;

  const SeeMoreLessWidget({
    super.key,
    required this.textData,
    required this.type,
    required this.onSeeMoreLessTap,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: InkWell(
          onTap: () {
            if (onSeeMoreLessTap != null) {
              onSeeMoreLessTap!();
            }
          },
          child: Text.rich(
            TextSpan(
              text: "",
              children: [
                TextSpan(
                  text: textData,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.blue,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(
                    width: 3.0,
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    (type == 1)
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.blue,
                    size: 17.5,
                  ),
                )
              ],
            ),
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: Colors.blue,
            ),
            softWrap: true,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
