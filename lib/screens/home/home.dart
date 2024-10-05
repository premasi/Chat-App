import 'package:chat_app/widgets/chat_message.dart';
import 'package:chat_app/widgets/input_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;
    fcm.requestPermission();
    final token = await fcm.getToken();
    fcm.subscribeToTopic("chat");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupPushNotification();
  }

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
        child: Column(
          children: [Expanded(child: ChatMessage()), InputMessage()],
        ),
      ),
    );
  }
}
