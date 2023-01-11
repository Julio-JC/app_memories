import 'package:flutter/material.dart';

void main() {
  runApp(const Memories());
}

class Memories extends StatelessWidget {
  const Memories({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recordações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
