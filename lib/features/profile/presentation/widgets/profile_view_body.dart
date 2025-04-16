import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
import '../../../../core/utils/assets.dart';
import '../../data/models/user_model.dart';
import 'edit_profile_button.dart';
import 'profile_avatar.dart';
import 'profile_menu.dart';

class ProfileViewBody extends StatefulWidget {
  final UserModel user;

  const ProfileViewBody({super.key, required this.user});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const ProfileAvatar(),
          const SizedBox(height: 10),
          Text('${widget.user.firstName} ${widget.user.lastName}', style: Styles.textStyle15),
          Text(widget.user.email, style: Styles.textStyle14SoftPink),
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
            onPress: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.bottomSlide,
                title: 'Are you sure?',
                desc: 'Do you want to log out of your account?',
                btnCancelText: 'Cancel',
                btnOkText: 'Log out',
                btnCancelOnPress: () {},
                btnOkOnPress: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    GoRouter.of(context).go(AppRouter.kAuth);

                    // Optional: Show confirmation
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You have been logged out successfully.'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ).show();
            },
          )
        ],
      ),
    );
  }
}
