import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:musafir_music/_utils/routes.dart';
import 'package:musafir_music/home/views/music_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.initial,
      getPages: publicPages,
      home: const HomeUI(),
    );
  }
}
