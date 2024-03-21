import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String? name;
  final String rollNumber;
  final String section;
  const Home({
    Key? key,
    this.name,
    required this.rollNumber,
    required this.section,
  }) : super(key: key);
  @override
  State<Home> createState() => HomeStateUI();
}

class HomeStateUI extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.name ?? ""),
                Text(widget.rollNumber),
                Text(widget.section),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
