import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:mentroverso/features/profile/presentation/views/profile_view.dart';
import 'package:mentroverso/features/profile/presentation/widgets/profile_view_body.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../../../Growing/growingScreen.dart';
import '../../../growing/presentation/views/growing_view.dart';
import '../../../navigation/custom_button_navigation_bar.dart';
import 'home_view_body.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 1;
  final List<Widget> pages = [
    GrowingView(),

    HomeViewBody(),
    ProfileView(),

  ];

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
            body: pages[currentIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(0),
              child: CustomNotchBottomNavBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                currentIndex: currentIndex,
              ),
            ))
      ],
    );
  }
}
