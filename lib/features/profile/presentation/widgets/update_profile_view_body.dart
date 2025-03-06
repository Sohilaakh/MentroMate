import 'package:flutter/cupertino.dart';
import 'package:mentroverso/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:mentroverso/features/profile/presentation/widgets/save_changes_button.dart';

import 'build_profile_form.dart';

class UpdateProfileViewBody extends StatelessWidget {
  const UpdateProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          ProfileAvatar(),
          SizedBox(height: 30),
          BuildProfileForm(),
          SizedBox(height: 20),
          SaveChangesButton()
        ],
      ),
    );
  }
}
