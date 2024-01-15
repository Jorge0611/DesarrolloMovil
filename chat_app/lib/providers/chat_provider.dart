import 'package:chat_app/config/helpers/request_helper.dart';
import 'package:chat_app/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final scrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Test message from me #1', fromWho: FromWho.me),
    Message(text: 'Test message from me #2', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    debugPrint('Sending message: $text');
    if (text.isEmpty) return;
    final message = Message(text: text, fromWho: FromWho.me);
    messageList.add(message);

    if (text.contains('?')) getMessage();

    notifyListeners();
    scrollToBottom();
  }

  Future<void> getMessage() async {
    debugPrint('Getting message');
    final message = await RequestHelper().getAnswer();
    messageList.add(message);

    notifyListeners();
    scrollToBottom();
  }

  void scrollToBottom() {
    debugPrint('Scrolling to bottom');

    double maxScrollExtent = scrollController.position.maxScrollExtent;

    debugPrint('maxScrollExtent: $maxScrollExtent');

    if (maxScrollExtent == 0) return;

    scrollController.animateTo(
      maxScrollExtent + 20,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
