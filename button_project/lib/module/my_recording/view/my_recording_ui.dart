import 'package:button_project/module/my_recording/controller/my_recording_bloc.dart';
import 'package:button_project/module/my_recording/controller/my_recording_event.dart';
import 'package:button_project/module/my_recording/controller/my_recording_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyRecording extends StatelessWidget {
  const MyRecording({super.key});

  @override
  build(BuildContext context) {
    if (Get.arguments != null && Get.arguments["data"] != null) {}

    return BlocProvider(
      create: (context) => MyRecordingBloc()..add(UserSignIn()),
    );
  }
}

class MyRecordingUI extends StatefulWidget {
  const MyRecordingUI({super.key});

  @override
  State<MyRecordingUI> createState() => _MyRecordingUIState();
}

class _MyRecordingUIState extends State<MyRecordingUI> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRecordingBloc, MyRecordingState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
