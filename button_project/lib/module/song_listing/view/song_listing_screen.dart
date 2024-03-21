import 'package:audioplayers/audioplayers.dart';
import 'package:button_project/_utils/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/song_listing_bloc.dart';

class SongListing extends StatelessWidget {
  const SongListing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongListingBloc(),
      child: const SongListingScreen(),
    );
  }
}

class SongListingScreen extends StatefulWidget {
  const SongListingScreen({super.key});

  @override
  State<SongListingScreen> createState() => _SongListingScreenState();
}

class _SongListingScreenState extends State<SongListingScreen> {
  AudioPlayer player = AudioPlayer();
  Duration sDuration = Duration.zero;
  bool isPlaying = false;

  void playSong() async {
    "Audio Player Started".logIt;
    await player.play(
      UrlSource(
          "https://freetestdata.com/wp-content/uploads/2021/09/Free_Test_Data_5MB_WAV.wav"),
    );
  }

  void pauseSong() async {
    "Audio Player Paused".logIt;
    await player.pause();
  }

  void stopSong() async {
    "Audio Player Stopped".logIt;
    await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongListingBloc, SongListingState>(
      listener: (context, state) {
        // if (state.isPlaying == true) {
        //   Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //       pageBuilder: (context, animation, secondaryAnimation) =>
        //           const Home(
        //         name: "Ram Kumar Shukla",
        //         rollNumber: "2",
        //         section: "A",
        //       ),
        //     ),
        //   );
        // }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              elevation: 0.0,
              title: const Text("Play Song"),
            ),
            body: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          "https://filmfare.wwmindia.com/content/2021/jun/new-bollywood-songs-nadiyon-paar-51623939732.jpg",
                          width: 200,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            if (!state.isPlaying) {
                              context
                                  .read<SongListingBloc>()
                                  .add(PlayPauseSong(false));
                              context.read<SongListingBloc>().add(
                                    CloseActionSheet(false),
                                  );
                              playSong();
                            } else {
                              context
                                  .read<SongListingBloc>()
                                  .add(PlayPauseSong(true));
                              pauseSong();
                            }
                          },
                          child: (state.isPlaying)
                              ? const Icon(
                                  Icons.pause_circle,
                                  size: 50,
                                )
                              : const Icon(
                                  Icons.play_circle,
                                  size: 50,
                                ),
                        ),
                      )
                    ],
                  ),
                  StreamBuilder<Duration>(
                      stream: player.onPositionChanged,
                      builder: (context, snapshot) {
                        if (sDuration == Duration.zero) {
                          player.getDuration().then(
                              (value) => sDuration = value ?? Duration.zero);
                        }
                        return Slider(
                            inactiveColor: Colors.white,
                            activeColor: Colors.white,
                            min: 0.0,
                            max: sDuration.inSeconds.toDouble(),
                            value: (snapshot.data ?? Duration.zero)
                                .inSeconds
                                .toDouble(),
                            onChanged: (value) {
                              "Value : $value".logIt;
                              setState(() {
                                player.seek(Duration(seconds: value.round()));
                              });
                            });
                      }),
                ],
              ),
            ),
            bottomSheet: Container(
                height: state.crossIcon ? 0 : 114,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.network(
                                  "https://filmfare.wwmindia.com/content/2021/jun/new-bollywood-songs-nadiyon-paar-51623939732.jpg",
                                  width: 50,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<SongListingBloc>().add(
                                        CloseActionSheet(true),
                                      );
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StreamBuilder<Duration>(
                                stream: player.onPositionChanged,
                                builder: (context, snapshot) {
                                  if (sDuration == Duration.zero) {
                                    player.getDuration().then((value) =>
                                        sDuration = value ?? Duration.zero);
                                  }
                                  return Slider(
                                      inactiveColor: Colors.white,
                                      activeColor: Colors.white,
                                      min: 0.0,
                                      max: sDuration.inSeconds.toDouble(),
                                      value: (snapshot.data ?? Duration.zero)
                                          .inSeconds
                                          .toDouble(),
                                      onChanged: (value) {
                                        "Value : $value".logIt;
                                        setState(() {
                                          player.seek(
                                              Duration(seconds: value.round()));
                                        });
                                      });
                                }),
                            OutlinedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(80, 35)),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFFCFDFF)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                  )),
                              onPressed: () {
                                if (state.isPlaying) {
                                  context
                                      .read<SongListingBloc>()
                                      .add(PlayPauseSong(false));
                                  playSong();
                                } else {
                                  context
                                      .read<SongListingBloc>()
                                      .add(PlayPauseSong(true));
                                  pauseSong();
                                }
                              },
                              child: const Text("Play"),
                            )
                          ],
                        ),
                      ]),
                )));
      },
    );
  }
}
