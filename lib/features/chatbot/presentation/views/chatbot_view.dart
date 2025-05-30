
import 'package:flutter/material.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widget/chatbot_view_body.dart';
import '../widget/drawer.dart';

class ChatbotView extends StatefulWidget {
  final List<String>? suggestedCourses; // Receive suggested courses
  final String? chatId;

  const ChatbotView({super.key, this.suggestedCourses,this.chatId,});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearGradientBackGroundColor(
          beginColor: Alignment.bottomLeft,
          endColor: Alignment.topRight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: ColorResources.darkTransparentGray,
            elevation: 0,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Chatbot',
              style: Styles.textStyle18,
            ),
          ),
          drawer: ChatDrawer(),
          body: ChatbotViewBody(suggestedCourses: widget.suggestedCourses,chatId: widget.chatId), // Pass to body
        ),
      ],
    );
  }
}