import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: const Center(
        child: Text(
          "Loading...",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
