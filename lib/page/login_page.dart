import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Icon(Icons.login),
            const SizedBox(
              height: 50,
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              child: const Text('Login'),
            ),
          ]),
        ),
      ),
    );
  }
}
