part of 'song_listing_bloc.dart';

abstract class SongListingEvent {}

class PlayPauseSong extends SongListingEvent {
  bool isPlaying;
  PlayPauseSong(this.isPlaying);
}

class CloseActionSheet extends SongListingEvent {
  bool crossIcon;
  CloseActionSheet(this.crossIcon);
}
