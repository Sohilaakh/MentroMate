import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByUser;
  final bool isFile; // New flag for file messages

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSentByUser,
    this.isFile = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSentByUser) const CircleAvatar(child: Icon(Icons.smart_toy)), // AI avatar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(12),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          decoration: BoxDecoration(
            color: isSentByUser ? Colors.teal : Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: isSentByUser ? const Radius.circular(20) : Radius.zero,
              bottomRight: isSentByUser ? Radius.zero : const Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isFile) ...[
                Icon(Icons.attach_file, color: Colors.white), // Show file icon
                SizedBox(width: 5),
              ],
              Expanded(
                child: MarkdownBody(
                data: message,
                selectable: true,
                onTapLink: (text, href, title) async {
                  if (href != null) {
                    final uri = Uri.parse(href);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $href';
                    }
                  }
                },
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                    color: isSentByUser ? Colors.white : Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),

      // MarkdownBody(
                //   data: message,
                //   selectable: true,
                //   styleSheet: MarkdownStyleSheet(
                //     p: TextStyle(
                //       color: isSentByUser ? Colors.white : Colors.black87,
                //       fontSize: 16,
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
