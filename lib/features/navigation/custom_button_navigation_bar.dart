import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class CustomNotchBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNotchBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNotchBottomNavBar> createState() =>
      _CustomNotchBottomNavBarState();
}

class _CustomNotchBottomNavBarState extends State<CustomNotchBottomNavBar> {
  final _controller = NotchBottomBarController(index: 1);

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      bottomBarWidth: double.infinity,
      notchBottomBarController: _controller,
      color: ColorResources.transparentBlack,
      showShadow: false,
      showLabel: false,
      showBottomRadius: false,
      notchColor: ColorResources.softWhite,
      bottomBarItems:  [
        BottomBarItem(
          inActiveItem: Icon(Icons.rocket_launch , color: ColorResources.softWhite),
          activeItem: Icon(Icons.rocket_launch , color: ColorResources.darkMauve),
        ),
        BottomBarItem(
          inActiveItem: const Icon(Icons.home_outlined, color: Colors.white),
          activeItem: Icon(Icons.home, color: ColorResources.darkMauve),
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.person_outlined, color: ColorResources.softWhite),
          activeItem: Icon(Icons.person, color: ColorResources.darkMauve),
        ),
      ],
      onTap: (index) {
        widget.onTap(index);
        setState(() => _controller.index = index);
      },
      kIconSize: 15,
      kBottomRadius: 10,
    );
  }
}
