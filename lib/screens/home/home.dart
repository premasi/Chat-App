import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Chatting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text("chatting nich"),
      ),
    );
  }
}
