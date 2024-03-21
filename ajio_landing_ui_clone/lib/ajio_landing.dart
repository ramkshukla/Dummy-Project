import 'package:ajio_landing_ui_clone/ajio_app_bar.dart';
import 'package:flutter/material.dart';

class AjioLanding extends StatelessWidget {
  const AjioLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: const Column(
          children: [
            SizedBox(height: 20),
            AjioAppBar(),
          ],
        ),
      ),
    );
  }
}
