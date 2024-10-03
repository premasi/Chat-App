import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Chat App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: FirebaseAuth.instance.signOut,
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ))
        ],
      ),
      body: const Center(
        child: Text("chatting nich"),
      ),
    );
  }
}
