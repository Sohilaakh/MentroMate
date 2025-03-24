import 'package:flutter/material.dart';

class ChatInputBox extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback onSend;
  final VoidCallback onAttach;

  const ChatInputBox({
    super.key,
    required this.messageController,
    required this.onSend,
    required this.onAttach,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.tealAccent, width: 2),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.white),
            onPressed: onAttach,
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Message....",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
