import 'package:app_memories/page/checagem_page.dart';
import 'package:app_memories/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const Memories(),
  );
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
      home: const ChecagemPage(),
    );
  }
}
