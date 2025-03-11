import 'package:flutter/material.dart';
import 'package:mentroverso/core/widgets/custom_app_bar.dart';
import 'package:mentroverso/features/registration/presentation/widgets/back_ground_color.dart';

import '../widget/chatbot_view_body.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundColor(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Chatbot',
            icon: (Icons.menu )
          ),
          body: ChatbotViewBody(),
        ),
      ],
    );
  }
}
