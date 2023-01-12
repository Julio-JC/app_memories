import 'package:app_memories/page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.login,
                    size: 50,
                    color: Colors.purple,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: ListView(children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          label: Text('E-mail'),
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          label: Text('Password'),
                          fillColor: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text('Login'),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário ou senha incorreta.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuário ou senha incorreta.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
