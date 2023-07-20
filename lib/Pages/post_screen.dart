import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_new1/Homepage/Login_screen.dart';
import 'package:flutter/material.dart';

class Postscreen extends StatefulWidget {
  const Postscreen({super.key});

  @override
  State<Postscreen> createState() => _PostscreenState();
}

class _PostscreenState extends State<Postscreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Flutter Quiz",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginscreen()));
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
