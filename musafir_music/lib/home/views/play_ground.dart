import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:musafir_music/home/controller/home_bloc.dart';
import 'package:musafir_music/home/controller/home_event.dart';
import 'package:musafir_music/home/controller/home_state.dart';

class PlayGround extends StatelessWidget {
  const PlayGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgSrc = "";
    String song = "";
    String songName = "";
    String artistName = "";
    List musicData = [];
    if (Get.arguments != null) {
      musicData = Get.arguments["musicData"];
      imgSrc = Get.arguments['imgSrc'];
      song = Get.arguments['song'];
      songName = Get.arguments['songName'];
      artistName = Get.arguments['artistName'];
    }
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: PlayerGroundUI(
        musicData: musicData,
        imgSrc: imgSrc,
        song: song,
        songName: songName,
        artistName: artistName,
      ),
    );
  }
}

class PlayerGroundUI extends StatefulWidget {
  const PlayerGroundUI({
    super.key,
    required this.imgSrc,
    required this.song,
    required this.songName,
    required this.artistName,
    required this.musicData,
  });
  final String imgSrc;
  final String song;
  final String songName;
  final String artistName;
  final List musicData;
  @override
  State<PlayerGroundUI> createState() => _PlayerGroundUIState();
}

class _PlayerGroundUIState extends State<PlayerGroundUI> {
  AudioPlayer? player;

  @override
  void initState() {
    player = AudioPlayer();

    super.initState();
  }

  void playSong(int i) {
    player!.play(AssetSource(widget.musicData[i]["songUrl"]));
    context.read<HomeBloc>().add(PlayPauseSong(value: true));
  }

  @override
  void dispose() {
    player!.dispose();
    super.dispose();
  }

  Duration sDuration = Duration.zero;

  void pauseSong() {
    player!.pause();
    context.read<HomeBloc>().add(PlayPauseSong(value: false));
  }

  void stopSong() async {
    await player!.stop();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      player!.pause();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text("Now Playing"),
            centerTitle: true,
            actions: const [
              Icon(Icons.share_outlined),
              SizedBox(width: 8),
              Icon(Icons.more_vert),
              SizedBox(width: 20)
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 380,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: Image.asset(widget.imgSrc).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.songName,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.artistName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.favorite_outline_outlined,
                      size: 40,
                    )
                  ],
                ), // if (isPlaying)
                const SizedBox(height: 26),
                StreamBuilder<Duration>(
                  stream: player!.onPositionChanged,
                  builder: (context, snapshot) {
                    if (sDuration == Duration.zero) {
                      player!
                          .getDuration()
                          .then((value) => sDuration = value ?? Duration.zero);
                    }
                    return Column(
                      children: [
                        SliderTheme(
                          data: SliderThemeData(
                            overlayShape: SliderComponentShape.noOverlay,
                            trackShape: const RoundedRectSliderTrackShape(),
                          ),
                          child: Slider(
                            activeColor: Colors.green,
                            min: 0.0,
                            max: sDuration.inSeconds.toDouble(),
                            value: (snapshot.data ?? Duration.zero)
                                .inSeconds
                                .toDouble(),
                            onChanged: (value) {
                              setState(
                                () {
                                  player!
                                      .seek(Duration(seconds: value.round()));
                                },
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(sDuration.inSeconds.toString()),
                            Text(sDuration.inSeconds.toString()),
                          ],
                        )
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shuffle,
                        size: 30,
                        color: Colors.grey[400],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        for (var i = widget.musicData.length - 1; i > 0; i--) {
                          playSong(i);
                        }
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (!state.isPlaying) {
                          playSong(0);
                        } else {
                          pauseSong();
                        }
                      },
                      icon: Icon(
                        state.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        for (var i = 0; i < widget.musicData.length; i++) {
                          playSong(i);
                        }
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.repeat,
                        size: 30,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
