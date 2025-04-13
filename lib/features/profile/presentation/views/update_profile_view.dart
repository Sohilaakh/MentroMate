import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';
import '../../bloc/profile_state.dart';
import '../../domain/repositories/user_repository_impl.dart';
import '../widgets/update_profile_view_body.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    final userRepository = UserRepositoryImpl(FirebaseFirestore.instance);

    return BlocProvider(
      create: (_) => ProfileBloc(userRepository)..add(LoadUserProfile(uid)),
      child: Stack(
        children: [
          LinearGradientBackGroundColor(
            beginColor: Alignment.bottomLeft,
            endColor: Alignment.topRight,
          ),
          Scaffold(
            appBar: AppBar(
              surfaceTintColor: ColorResources.transparentBlack,
              backgroundColor: ColorResources.transparentBlack,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Profile',
                style: Styles.textStyle20,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            backgroundColor: Colors.transparent,
            body: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  return UpdateProfileViewBody(user: state.user);
                } else if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
