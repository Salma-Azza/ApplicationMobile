// views/chat_boot_screen.dart
import 'package:bz/features/chat_boot/widgets/chat_boot_body.dart';
import 'package:bz/features/chat_boot/widgets/chat_boot_form.dart';
import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ChatBootScreen extends StatelessWidget {
  const ChatBootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Chat Boot',
          style: AppTextStyle.withColor(AppTextStyle().h3, Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: const [
          Expanded(child: ChatBootBody()),
          ChatBootForm(),
        ],
      ),
      // ),
    );
  }
}
