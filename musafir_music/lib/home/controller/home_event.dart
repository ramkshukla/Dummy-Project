abstract class HomeEvent {}

class PlayPauseSong extends HomeEvent {
  final bool value;
  PlayPauseSong({required this.value});
}
