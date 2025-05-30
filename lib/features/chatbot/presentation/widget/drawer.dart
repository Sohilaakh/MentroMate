import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/app_routes.dart';

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({super.key});

  Stream<List<Map<String, dynamic>>> chatStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return const Stream.empty();

    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorResources.softWhite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.search, color: ColorResources.darkMauve),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: ColorResources.darkMauve),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: chatStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No chats found'));
                    }

                    final chats = snapshot.data!;
                    final grouped = _groupByDate(chats);

                    return ListView(
                      children: grouped.entries.map((entry) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorResources.forestGreen,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ...entry.value.map((chat) => buildChatItem(chat, context)),
                            const Divider(),
                            const SizedBox(height: 10),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, List<Map<String, dynamic>>> _groupByDate(List<Map<String, dynamic>> chats) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var chat in chats) {
      final ts = chat['timestamp'] as Timestamp?;
      if (ts == null) continue;
      final dateKey = DateFormat('yyyy-MM-dd').format(ts.toDate());
      grouped.putIfAbsent(dateKey, () => []).add(chat);
    }
    return grouped;
  }

  Widget buildChatItem(Map<String, dynamic> chat, BuildContext context) {
    final title = chat['title'] ?? 'Untitled Chat';
    final chatId = chat['id'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // Close the drawer
            GoRouter.of(context).push(
              AppRouter.kChat,
              extra: {'chatId': chatId},
            );
          },
          child: Row(
            children: [
              Icon(Icons.chat_rounded, color: ColorResources.darkMauve),
              const SizedBox(width: 10),
              Text(title, style: TextStyle(color: ColorResources.forestGreen)),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: ColorResources.darkMauve),
          onPressed: () async {
            final userId = FirebaseAuth.instance.currentUser?.uid;
            if (userId != null) {
              await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(userId)
                  .collection('chats')
                  .doc(chatId)
                  .delete();
            }
          },
        ),
      ],
    );
  }
}
