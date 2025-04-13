import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mentroverso/core/utils/assets.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';
import 'package:mentroverso/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:mentroverso/features/profile/presentation/widgets/profile_menu.dart';
import '../../../../core/utils/app_routes.dart';
import '../../data/models/user_model.dart';
import 'edit_profile_button.dart';

class ProfileViewBody extends StatelessWidget {
  final UserModel user;

  const ProfileViewBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          ProfileAvatar(
            currentImageUrl: user.profileImage,
            isEditable: false,
          ),
          const SizedBox(height: 10),
          Text(
            '${user.firstName} ${user.lastName}',
            style: Styles.textStyle15,
          ),
          Text(
            user.email,
            style: Styles.textStyle14SoftPink,
          ),
          const SizedBox(height: 8),
          const EditProfileButton(),
          const SizedBox(height: 10),
          Divider(
            color: ColorResources.lightTransparentGray.withAlpha(128),
            thickness: 0.1,
          ),
          ProfileMenuItem(
            title: 'Courses',
            icon: LineAwesomeIcons.book_open_solid,
            onPress: () {},
          ),
          ProfileMenuItem(
            title: 'Grades',
            imagePath: AssetsData.grads,
            onPress: () {
              GoRouter.of(context).push(AppRouter.kGradsView);
            },
          ),
          ProfileMenuItem(
            title: 'Feedbacks',
            icon: LineAwesomeIcons.comment_solid,
            onPress: () {
              GoRouter.of(context).push(AppRouter.kFeedbackView);
            },
          ),
          ProfileMenuItem(
            title: 'Log out',
            imagePath: AssetsData.logOutIcon,
            onPress: () {},
          ),
        ],
      ),
    );

  }
}
