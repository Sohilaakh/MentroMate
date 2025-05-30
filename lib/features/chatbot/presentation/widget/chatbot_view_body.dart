// import 'dart:async';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:mentroverso/features/chatbot/presentation/widget/deep_seek.dart';
// import 'chat_bubble.dart';
// import 'chat_input_text.dart';
//
// class ChatbotViewBody extends StatefulWidget {
//   const ChatbotViewBody({super.key, required List<String> suggestedCourses});
//
//   @override
//   _ChatbotViewBodyState createState() => _ChatbotViewBodyState();
// }
//
// class _ChatbotViewBodyState extends State<ChatbotViewBody> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   final List<Map<String, dynamic>> _messages = []; // Stores messages
//   final DeepSeekService _deepSeekService = DeepSeekService();
//   bool _isTyping = false; // To show typing indicator
//
//   void _sendMessage() {
//     String userMessage = _messageController.text.trim();
//     if (userMessage.isEmpty) return;
//
//     setState(() {
//       _messages.add({"text": userMessage, "isSentByUser": true});
//       _isTyping = true;
//     });
//
//     _messageController.clear();
//     _scrollToBottom();
//
//     // Placeholder for the bot response
//     int botMessageIndex = _messages.length;
//     _messages.add({"text": "", "isSentByUser": false});
//
//     String botResponse = "";
//
//     _deepSeekService.streamResponse(userMessage).listen((chunk) {
//       setState(() {
//         botResponse += chunk;
//         _messages[botMessageIndex]["text"] = botResponse;
//       });
//       _scrollToBottom();
//     }, onDone: () {
//       setState(() {
//         _isTyping = false;
//       });
//       _scrollToBottom();
//     }, onError: (error) {
//       setState(() {
//         _messages[botMessageIndex]["text"] = "Error: $error";
//         _isTyping = false;
//       });
//       _scrollToBottom();
//     });
//   }
//
//   void _scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }
//
//   void _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//     if (result != null) {
//       PlatformFile pickedFile = result.files.single;
//
//       setState(() {
//         _messages.add({
//           "text": pickedFile.name, // Show only file name
//           "isSentByUser": true,
//           "isFile": true, // Flag to differentiate file messages
//         });
//         _isTyping = true; // Show progress indicator
//       });
//
//       File file = File(pickedFile.path!);
//       String fileContent = await file.readAsString();
//
//
//       _analyzeFile(fileContent);
//     }
//   }
//
//
//   Future<String> _readFileContent(File file) async {
//     try {
//       return await file.readAsString();
//     } catch (e) {
//       return "Error reading file: $e";
//     }
//   }
//
//   void _analyzeFile(String content) {
//     _deepSeekService.analyzeFile(content).then((response) {
//       setState(() {
//         _messages.add({
//           "text": response,
//           "isSentByUser": false,
//         });
//         _isTyping = false;
//       });
//       _scrollToBottom();
//     }).catchError((error) {
//       setState(() {
//         _messages.add({
//           "text": "Error: $error",
//           "isSentByUser": false,
//         });
//         _isTyping = false;
//       });
//       _scrollToBottom();
//     });
//   }
//
//
//   @override
//   void dispose() {
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             controller: _scrollController,
//             padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
//             itemCount: _messages.length + (_isTyping ? 1 : 0),
//             itemBuilder: (context, index) {
//               if (_isTyping && index == _messages.length) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: CircularProgressIndicator(color: Colors.tealAccent),
//                   ),
//                 );
//               }
//
//               final message = _messages[index];
//               return ChatBubble(
//                 message: message["text"],
//                 isSentByUser: message["isSentByUser"],
//                 isFile: message["isFile"] ?? false, // Pass file flag
//               );
//             },
//           ),
//         ),
//
//         ChatInputBox(
//           messageController: _messageController,
//           onSend: _sendMessage,
//           onAttach: _pickFile, // Call _pickFile when attachment button is clicked
//         ),
//       ],
//     );
//   }
// }
//
//
//

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/features/chatbot/presentation/widget/deep_seek.dart';
import 'chat_bubble.dart';
import 'chat_input_text.dart';

class ChatbotViewBody extends StatefulWidget {
  final List<String> suggestedCourses; // Receive suggested courses

  const ChatbotViewBody({super.key, required this.suggestedCourses});

  @override
  _ChatbotViewBodyState createState() => _ChatbotViewBodyState();
}

class _ChatbotViewBodyState extends State<ChatbotViewBody> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = []; // Stores messages
  final DeepSeekService _deepSeekService = DeepSeekService();
  bool _isTyping = false; // To show typing indicator

  @override
  void initState() {
    super.initState();
    _sendSuggestedCoursesMessage(); // Send the automatic message when chatbot opens
  }

  /// ✅ **Send Suggested Courses as Clickable Links**
  // void _sendSuggestedCoursesMessage() {
  //   if (widget.suggestedCourses.isNotEmpty) {
  //     setState(() {
  //       _isTyping = true;
  //     });
  //
  //     _deepSeekService.generateSuggestedCoursesMessage(widget.suggestedCourses).then((message) {
  //       setState(() {
  //         _messages.add({
  //           "text": _formatMessage(message),
  //           "isSentByUser": false,
  //         });
  //         _isTyping = false;
  //       });
  //       _scrollToBottom();
  //     }).catchError((error) {
  //       setState(() {
  //         _messages.add({"text": "❌ Error: $error", "isSentByUser": false});
  //         _isTyping = false;
  //       });
  //       _scrollToBottom();
  //     });
  //   }
  // }
  void _sendSuggestedCoursesMessage() {
    if (widget.suggestedCourses.isNotEmpty) {
      setState(() {
        _isTyping = true;
        _messages.add({"text": "", "isSentByUser": false});
      });

      int botMessageIndex = _messages.length - 1;
      String botResponse = "";

      _deepSeekService.generateSuggestedCoursesMessage(
        widget.suggestedCourses,
            (titles) {
          // ✅ Do something with the extracted course titles (e.g. save to Firestore)
          print("Extracted course titles: $titles");

          // Example: Save to variable or Firebase
          // _saveSuggestedCoursesToFirestore(titles); // implement this if needed
        },
      ).listen((chunk) {
        setState(() {
          botResponse += chunk;
          _messages[botMessageIndex]["text"] = botResponse;
        });
        _scrollToBottom();
      }, onDone: () {
        setState(() {
          _isTyping = false;
        });
        _scrollToBottom();
      }, onError: (error) {
        setState(() {
          _messages[botMessageIndex]["text"] = "Error: $error";
          _isTyping = false;
        });
        _scrollToBottom();
      });
    }
  }




  /// ✨ **Send User Message and Stream AI Response**
  void _sendMessage() {
    String userMessage = _messageController.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({"text": userMessage, "isSentByUser": true});
      _isTyping = true;
    });

    _messageController.clear();
    _scrollToBottom();

    int botMessageIndex = _messages.length;
    _messages.add({"text": "", "isSentByUser": false});

    String botResponse = "";

    _deepSeekService.streamResponse(userMessage).listen((chunk) {
      setState(() {
        botResponse += chunk;
        _messages[botMessageIndex]["text"] = _formatMessage(botResponse);
      });
      _scrollToBottom();
    }, onDone: () {
      setState(() {
        _isTyping = false;
      });
      _scrollToBottom();
    }, onError: (error) {
      setState(() {
        _messages[botMessageIndex]["text"] = "❌ Error: $error";
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  /// 📂 **Handle File Upload**
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile pickedFile = result.files.single;

      setState(() {
        _messages.add({
          "text": "📎 **File Uploaded:** ${pickedFile.name}",
          "isSentByUser": true,
          "isFile": true, // Flag to differentiate file messages
        });
        _isTyping = true; // Show progress indicator
      });

      File file = File(pickedFile.path!);
      String fileContent = await file.readAsString();

      _analyzeFile(fileContent);
    }
  }

  void _analyzeFile(String content) {
    _deepSeekService.analyzeFile(content).then((response) {
      setState(() {
        _messages.add({
          "text": _formatMessage(response),
          "isSentByUser": false,
        });
        _isTyping = false;
      });
      _scrollToBottom();
    }).catchError((error) {
      setState(() {
        _messages.add({
          "text": "❌ Error: $error",
          "isSentByUser": false,
        });
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  /// 🔹 **Format AI Responses**
  String _formatMessage(String message) {
    return message
        .replaceAllMapped(RegExp(r'(\d+)\. '), (match) => "\n${match.group(1)}. ") // Numbered lists
        .replaceAllMapped(RegExp(r'\*([^\*]+)\*'), (match) => "**${match.group(1)}**") // Bold text
        .replaceAll("\n", "\n\n"); // Add spacing between paragraphs
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            itemCount: _messages.length + (_isTyping ? 1 : 0),
            itemBuilder: (context, index) {
              if (_isTyping && index == _messages.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircularProgressIndicator(color: Colors.tealAccent),
                  ),
                );
              }

              final message = _messages[index];
              return ChatBubble(
                message: message["text"],
                isSentByUser: message["isSentByUser"],
                isFile: message["isFile"] ?? false, // Pass file flag
              );
            },
          ),
        ),

        ChatInputBox(
          messageController: _messageController,
          onSend: _sendMessage,
          onAttach: _pickFile, // Call _pickFile when attachment button is clicked
        ),
      ],
    );
  }
}


