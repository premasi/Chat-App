import 'package:chat_app/widgets/message_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final account = FirebaseAuth.instance.currentUser!;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy("createdAt", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No message",
              style: TextStyle(color: Colors.purple, fontSize: 16),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something went wrong..",
              style: TextStyle(color: Colors.purple, fontSize: 16),
            ),
          );
        }
        final loadedData = snapshot.data!.docs;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          reverse: true,
          itemBuilder: (context, index) {
            final message = loadedData[index].data();
            final nextMessage = index + 1 < loadedData.length
                ? loadedData[index + 1].data()
                : null;
            final currentMessageId = message['userId'];
            final nextMessageId =
                nextMessage != null ? nextMessage['userId'] : null;
            final checkNextUserId = nextMessageId == currentMessageId;
            if (checkNextUserId) {
              return MessageBubble.next(
                  message: message["text"],
                  isMe: account.uid == currentMessageId);
            } else {
              return MessageBubble.first(
                  userImage: message["image_url"],
                  username: message["user_name"],
                  message: message['text'],
                  isMe: account.uid == currentMessageId);
            }
          },
          itemCount: loadedData.length,
        );
      },
    );
  }
}
