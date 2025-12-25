import 'package:bz/features/chat_boot/data/models/rag_request.dart';
import 'package:bz/features/chat_boot/data/models/rag_response.dart';
import 'package:bz/features/chat_boot/data/repositories/rag_response_repository.dart';
import 'package:flutter/foundation.dart';

class ChatController with ChangeNotifier {
  final RagResponseRepository _repo;

  List<Map<String, String>> chat =
      []; // store as simple Map<String,String> for easier use

  ChatController(this._repo);

  Future<void> sendMessage(String userMessage) async {
    print("kkkkkk");
    if (userMessage.trim().isEmpty) return;

    // Add user's message to chat
    chat.add({'question': userMessage, 'answer': ''});
    notifyListeners();

    try {
      // Call API
      RagRequest req = RagRequest(question: userMessage);
      RagResponse res = await _repo.getAnswer(req);

      // Update the last chat entry with answer
      chat[chat.length - 1]['answer'] = res.answer ?? '';
      notifyListeners();
    } catch (err) {
      // Optionally handle API error
      chat[chat.length - 1]['answer'] = 'Error: $err';
      notifyListeners();
    }
  }
}
