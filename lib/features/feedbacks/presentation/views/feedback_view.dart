import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';
import 'package:mentroverso/features/feedbacks/presentation/widgets/feedback_view_body.dart';

import '../../../../core/widgets/linear_gradient_back_ground_color.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

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
            backgroundColor: ColorResources.transparentBlack,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            title: Text(
              'Feedbacks',
              style: Styles.textStyle20,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,

          ),
          body: FeedBackViewBody(),
        ),
      ],
    );
  }
}
