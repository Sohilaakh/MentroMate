import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({super.key});

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
                    icon:
                    Icon(Icons.search, color: ColorResources.darkMauve),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: ColorResources.darkMauve),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView(
                  children: [
                    buildChatSection("Chats Date"),
                    buildChatSection("Chats Date"),
                    buildChatSection("Chats Date"),
                    buildChatSection("Chats Date"),
                    buildChatSection("Chats Date"),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorResources.forestGreen),
        ),
        SizedBox(height: 10,),

        buildChatItem(),
        buildChatItem(),
        buildChatItem(),
        const Divider(),
        SizedBox(height: 10,),

      ],
    );
  }

  Widget buildChatItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.chat_rounded, color: ColorResources.darkMauve),
            SizedBox(width: 10,),
            Text("Chat Title", style: TextStyle(color: ColorResources.forestGreen)),
          ],
        )
       ,
        IconButton(
          icon: Icon(Icons.delete, color: ColorResources.darkMauve),
          onPressed: () {},
        ),
      ],
    );
  }
}
