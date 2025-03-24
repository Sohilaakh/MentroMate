import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByUser;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSentByUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sentGradient = const LinearGradient(
      colors: [
        Color(0xFF3DC1AC),
        Color(0xFF409C9B),
      ],
    );

    final receivedGradient = const LinearGradient(
      colors: [
        Color(0xFFF7E9F2),
        Color(0xFFF7E9F2),
      ],
    );

    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          gradient: isSentByUser ? sentGradient : receivedGradient,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isSentByUser ? const Radius.circular(20) : Radius.zero,
            bottomRight: isSentByUser ? Radius.zero : const Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
