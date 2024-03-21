import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:musafir_music/_utils/routes.dart';
import 'package:musafir_music/_utils/string_constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeUI();
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool isProfileSelected = true;
  List musicData = [];

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  Future<void> apiCall() async {
    final String response =
        await rootBundle.loadString("lib/home/model/music_data.json");
    final data = json.decode(response);
    musicData = data["data"];
  }

  final List<String> musicLabel = [
    "All",
    "Music",
    "Podcasts",
    "Recently",
    "Popular"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good morning",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                height: 0.0,
                                letterSpacing: 1.0,
                              ),
                      textScaleFactor: 1.0,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          "https://cdn1.iconfinder.com/data/icons/avatars-55/100/avatar_profile_user_music_headphones_shirt_cool-512.png"),
                      radius: 30,
                    )
                  ],
                ),

                //Label Text
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: musicLabel.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2.0),
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            musicLabel[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  height: 1.0,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 20);
                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Curated Playlist",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(letterSpacing: 1.0, height: 0.0),
                    ),
                    TextButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (contex) => CuratedPlaylist(
                        //       imgScr: pictures,
                        //     ),
                        //   ),
                        // );
                        Get.toNamed(
                          RouteName.curatedPlaylist,
                          arguments: {"imgSrc": musicData},
                        );
                      },
                      child: Text(
                        "show all",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            height: 0.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
                // Curated Playlist

                SizedBox(
                  height: 240,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: musicData.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    Image.asset(musicData[index]["thumbnail"])
                                        .image,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(musicData[index]["songTitle"]),
                                Text(
                                  musicData[index]["artistName"],
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recently Played",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(letterSpacing: 1.0, height: 0.0),
                    ),
                    TextButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: Text(
                        "show all",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            height: 0.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),

                // Recently Played
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: musicData.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => PlayerGround(
                              //       imgSrc: pictures[index],
                              //     ),
                              //   ),
                              // );
                              Get.toNamed(
                                RouteName.playGround,
                                arguments: {
                                  "musicData": musicData,
                                  "imgSrc": musicData[index]["thumbnail"],
                                  "song": musicData[index]["songUrl"],
                                  "songName": musicData[index]["songTitle"],
                                  "artistName": musicData[index]["artistName"],
                                },
                              );
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.lightBlue),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      Image.asset(musicData[index]["thumbnail"])
                                          .image,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(musicData[index]["songTitle"]),
                          Text(musicData[index]["artistName"])
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppConstants.topArtist,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(letterSpacing: 1.0, height: 0.0),
                    ),
                    TextButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: Text(
                        AppConstants.seeAll,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            height: 0.0,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
                // Top Artist
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,

                        backgroundImage: NetworkImage(
                          "https://www.zastavki.com/pictures/originals/2013/Music_American_singer_Selena_Gomes_053793_.jpg",
                        ),
                        // child: ,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
              label: AppConstants.listen,
              icon: Icon(Icons.play_arrow_rounded),
            ),
            BottomNavigationBarItem(
              label: AppConstants.search,
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: AppConstants.library,
              icon: Icon(Icons.menu_rounded),
            ),
            BottomNavigationBarItem(
              label: AppConstants.profile,
              icon: Icon(Icons.person_add_alt),
            ),
          ],
        ),
      ),
    );
  }
}
