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
  String nome = '';

  @override
  void initState() {
    super.initState();
    user();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Lembraças de $nome '),
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

  Future<void> user() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      setState(() {
        nome = user.displayName!;
      });
    }
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
