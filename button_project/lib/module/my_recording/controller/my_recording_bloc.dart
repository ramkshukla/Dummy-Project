import 'package:button_project/module/my_recording/controller/my_recording_event.dart';
import 'package:button_project/module/my_recording/controller/my_recording_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRecordingBloc extends Bloc<MyRecordingEvent, MyRecordingState> {
  MyRecordingBloc() : super(MyRecordingState.initial()) {
    on<UserSignIn>(
      (event, emit) {
        emit(state.copyWith(signIn: true));
      },
    );
  }
}
