import 'package:app_memories/page/checagem_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Suas lembraças'),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: const Center(
          child: Text('Home Page!'),
        ),
      ),
    );
  }

  logout() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ChecagemPage(),
            ),
          ),
        );
  }
}
