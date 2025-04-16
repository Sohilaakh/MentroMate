import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/core/widgets/linear_gradient_back_ground_color.dart';
import 'package:mentroverso/features/growing/presentation/views/growing_view.dart';
import 'package:mentroverso/features/home/presentation/widgets/home_app_bar.dart';
import 'package:mentroverso/features/navigation/custom_button_navigation_bar.dart';
import 'package:mentroverso/features/profile/bloc/profile_bloc.dart';
import 'package:mentroverso/features/profile/bloc/profile_event.dart';
import 'package:mentroverso/features/profile/domain/repositories/user_repository_impl.dart';
import 'package:mentroverso/features/profile/presentation/views/profile_view.dart';
import 'package:mentroverso/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum HomeTabs { growing, home, profile }

class _HomeViewState extends State<HomeView> {
  HomeTabs currentTab = HomeTabs.home;

  late final String uid;
  late final UserRepositoryImpl userRepository;

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    userRepository = UserRepositoryImpl(FirebaseFirestore.instance);
  }

  @override
  Widget build(BuildContext context) {
    final Map<HomeTabs, Widget> pages = {
      HomeTabs.growing: const GrowingView(),
      HomeTabs.home: const HomeViewBody(),
      HomeTabs.profile: BlocProvider(
        create: (_) => ProfileBloc(userRepository)..add(LoadUserProfile(uid)),
        child: const ProfileView(),
      ),
    };

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
          bottomNavigationBar: CustomNotchBottomNavBar(
            onTap: (index) {
              setState(() {
                currentTab = HomeTabs.values[index];
              });
            },
            currentIndex: currentTab.index,
          ),
        ),
      ],
    );
  }
}
