import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'chat_bubble.dart';
import 'chat_input_text.dart';

class ChatbotViewBody extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  ChatbotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChatBubble(message: "Hello!", isSentByUser: false),
          ChatBubble(message: "Hi! How are you?", isSentByUser: true),
          ChatInputBox(
            messageController: _messageController,
            onSend: () {
              if (kDebugMode) {
                print("Message Sent: ${_messageController.text}");
              }
              _messageController.clear();
            },
            onAttach: () {
              if (kDebugMode) {
                print("Attachment Button Clicked");
              }
            },
          ),
        ],
      ),
    );
  }
}
