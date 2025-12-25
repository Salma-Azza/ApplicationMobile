// widgets/chat_boot_form.dart
import 'package:bz/features/chat_boot/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBootForm extends StatefulWidget {
  const ChatBootForm({super.key});

  @override
  State<ChatBootForm> createState() => _ChatBootFormState();
}

class _ChatBootFormState extends State<ChatBootForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context
        .read<
          ChatController
        >(); // read (not watch) since we don't rebuild on change

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                controller.sendMessage(value);
                _controller.clear();
              },
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () {
              final text = _controller.text.trim();
              if (text.isNotEmpty) {
                controller.sendMessage(text);
                _controller.clear();
              }
            },
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
