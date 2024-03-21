// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'song_listing_bloc.dart';

class SongListingState {
  final bool isPlaying;
  final bool crossIcon;
  SongListingState({
    required this.isPlaying,
    required this.crossIcon,
  });

  // Initially isPlaying is false
  factory SongListingState.initial() =>
      SongListingState(isPlaying: false, crossIcon: false);

  SongListingState copyWith({bool? isPlaying, bool? crossIcon}) {
    return SongListingState(
      crossIcon: crossIcon ?? this.crossIcon,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  String toString() =>
      'SongListingState(isPlaying: $isPlaying, crossIcon: $crossIcon)';
}
