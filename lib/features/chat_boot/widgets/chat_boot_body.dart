import 'package:bz/features/chat_boot/controllers/chat_controller.dart';
import 'package:bz/features/chat_boot/widgets/body_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBootBody extends StatelessWidget {
  const ChatBootBody({super.key});

  @override
  Widget build(BuildContext context) {
    final chatList = context.watch<ChatController>().chat;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: chatList.length * 2, // each chat has user + bot
      itemBuilder: (context, index) {
        final chatIndex = index ~/ 2;
        final chat = chatList[chatIndex];

        final isUser = index.isEven;
        final text = isUser ? chat['question']! : chat['answer']!;

        // Skip empty bot responses
        if (!isUser && text.isEmpty) return const SizedBox.shrink();

        return ChatItem(text: text, isUser: isUser);
      },
    );
  }
}
