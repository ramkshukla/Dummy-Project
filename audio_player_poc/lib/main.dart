import 'package:audio_player_poc/widget_extension.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int _counter = 0;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // if (isPlaying)
            StreamBuilder<Duration>(
                stream: player.onPositionChanged,
                builder: (context, snapshot) {
                  if (sDuration == Duration.zero) {
                    player
                        .getDuration()
                        .then((value) => sDuration = value ?? Duration.zero);
                  }
                  return Slider(
                      min: 0.0,
                      max: sDuration.inSeconds.toDouble(),
                      value:
                          (snapshot.data ?? Duration.zero).inSeconds.toDouble(),
                      onChanged: (value) {
                        "Value : $value".logIt;
                        setState(() {
                          player.seek(Duration(seconds: value.round()));
                        });
                      });
                }),

            ElevatedButton(
              onPressed: () {
                playSong();
              },
              child: const Text("Play Song "),
            ),
            ElevatedButton(
              onPressed: () {
                pauseSong();
              },
              child: const Text("Pause Song "),
            ),
            ElevatedButton(
              onPressed: () {
                stopSong();
              },
              child: const Text("Stop Song "),
            )
          ],
        ),
      ),
    );
  }
}
