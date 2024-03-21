import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:musafir_music/home/controller/home_bloc.dart';

// ignore: must_be_immutable
class CuratedPlaylist extends StatelessWidget {
  CuratedPlaylist({
    Key? key,
  }) : super(key: key);
  List imgSrc = [];

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      imgSrc = Get.arguments['imgSrc'];
    }

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: CuratedPlaylistUI(
        imgScr: imgSrc,
      ),
    );
  }
}

class CuratedPlaylistUI extends StatefulWidget {
  const CuratedPlaylistUI({super.key, required this.imgScr});
  final List imgScr;

  @override
  State<CuratedPlaylistUI> createState() => _CuratedPlaylistUIState();
}

class _CuratedPlaylistUIState extends State<CuratedPlaylistUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.imgScr.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(widget.imgScr[index]["thumbnail"]).image,
              ),
            ),
          );
        }),
      ),
    );
  }
}
