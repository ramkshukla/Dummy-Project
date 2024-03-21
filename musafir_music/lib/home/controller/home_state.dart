class HomeState {
  final bool isPlaying;

  HomeState({required this.isPlaying});

  factory HomeState.initial() => HomeState(isPlaying: false);

  HomeState copyWith({bool? isPlaying}) {
    return HomeState(isPlaying: isPlaying ?? this.isPlaying);
  }
}
