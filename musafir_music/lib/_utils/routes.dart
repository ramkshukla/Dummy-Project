import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:musafir_music/home/views/curated_playlist.dart';
import 'package:musafir_music/home/views/music_ui.dart';
import 'package:musafir_music/home/views/play_ground.dart';

class RouteName {
  static const initial = '/';
  static const playGround = '/play_ground';
  static const curatedPlaylist = '/curated_playlist';
}

final publicPages = [
  GetPage(
    curve: Curves.easeOutQuint,
    name: RouteName.initial,
    page: () => const Home(),
  ),
  GetPage(
    curve: Curves.easeOutQuint,
    name: RouteName.curatedPlaylist,
    page: () => CuratedPlaylist(),
  ),
  GetPage(
    curve: Curves.easeOutQuint,
    name: RouteName.playGround,
    page: () => const PlayGround(),
  ),
];
