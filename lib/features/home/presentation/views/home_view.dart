import 'package:flutter/material.dart';
import 'package:mentroverso/features/home/presentation/widgets/custom_app_bar.dart';

import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        LinearGradientBackGroundColor(
          beginColor: Alignment.bottomLeft,
          endColor: Alignment.topRight,
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(),

          body: HomeViewBody(),
        )


      ],

    );
  }
}
