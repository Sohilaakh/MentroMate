import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';
import 'package:mentroverso/core/widgets/linear_gradient_back_ground_color.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_state.dart';
import '../widgets/update_profile_view_body.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
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
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('Profile', style: Styles.textStyle20),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.transparent,
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileLoaded) {
                return UpdateProfileViewBody(user: state.user);
              } else if (state is ProfileError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const SizedBox(); // fallback
              }
            },
          ),
        ),
      ],
    );
  }
}
