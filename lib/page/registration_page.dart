import 'package:app_memories/page/checagem_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text('Cadastro do Usuário'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              controller: _nameController,
              decoration:
                  const InputDecoration(label: Text('Nome do Ususário')),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(label: Text('e-mail')),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(label: Text('Senha')),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                cadastrar();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nameController.text);
        goChecagemPage();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mais forte.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Este e-mail já esta cadastrado.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  goChecagemPage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ChecagemPage()),
        (route) => false);
  }
}
