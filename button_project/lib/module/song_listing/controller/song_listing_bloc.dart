import 'package:flutter_bloc/flutter_bloc.dart';

part 'song_listing_event.dart';
part 'song_listing_state.dart';

class SongListingBloc extends Bloc<SongListingEvent, SongListingState> {
  SongListingBloc() : super(SongListingState.initial()) {
    on<PlayPauseSong>(
      (event, emit) => emit(
        state.copyWith(isPlaying: event.isPlaying),
      ),
    );
    on<CloseActionSheet>(
      (event, emit) => emit(
        state.copyWith(
          crossIcon: event.crossIcon,
        ),
      ),
    );
  }
}
