import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musafir_music/home/controller/home_event.dart';
import 'package:musafir_music/home/controller/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<PlayPauseSong>((event, emit) {
      emit(state.copyWith(isPlaying: event.value));
    });
  }
}
