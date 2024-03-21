class MyRecordingState {
  final bool signIn;
  MyRecordingState({required this.signIn});

  factory MyRecordingState.initial() => MyRecordingState(signIn: false);
  MyRecordingState copyWith({bool? signIn}) {
    return MyRecordingState(signIn: signIn ?? this.signIn);
  }

  @override
  String toString() {
    return "MyRecordingState(signIn: $signIn)";
  }
}
