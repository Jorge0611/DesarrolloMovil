import 'package:chat_app/entities/message.dart';
import 'package:chat_app/providers/chat_provider.dart';
import 'package:chat_app/widgets/friend_bubble.dart';
import 'package:chat_app/widgets/message_text_field.dart';
import 'package:chat_app/widgets/user_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.scrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return message.fromWho == FromWho.me
                    ? UserBubble(message: message.text)
                    : FriendBubble(
                        message: message.text, imageUrl: message.imageUrl);
              },
            ),
          ),
          const SizedBox(height: 10),
          MessageTextField(
            onValue: (value) => chatProvider.sendMessage(value),
          )
        ],
      ),
    );
  }
}
