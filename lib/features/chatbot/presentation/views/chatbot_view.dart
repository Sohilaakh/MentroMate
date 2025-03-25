import 'package:flutter/material.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widget/chatbot_view_body.dart';
import '../widget/drawer.dart';

class ChatbotView extends StatelessWidget {
  const ChatbotView({super.key});

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
          body: ChatbotViewBody(),

        ),
      ],
    );
  }
}
