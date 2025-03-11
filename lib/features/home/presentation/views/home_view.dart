import 'package:flutter/material.dart';
import 'package:mentroverso/features/home/presentation/widgets/home_app_bar.dart';
import 'package:mentroverso/features/profile/presentation/views/profile_view.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../../../growing/presentation/views/growing_view.dart';
import '../../../navigation/custom_button_navigation_bar.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum HomeTabs { growing, home, profile }

class _HomeViewState extends State<HomeView> {
  HomeTabs currentTab = HomeTabs.home;
  final Map<HomeTabs, Widget> pages = {
    HomeTabs.growing: const GrowingView(),
    HomeTabs.home: const HomeViewBody(),
    HomeTabs.profile: const ProfileView(),
  };

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
            appBar: HomeAppBar(),
            body: pages[currentTab],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(0),
              child: CustomNotchBottomNavBar(
                onTap: (index) {
                  setState(() {
                    currentTab = HomeTabs.values[index];
                  });
                },
                currentIndex: currentTab.index,
              ),
            ))
      ],
    );
  }
}
