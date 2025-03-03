import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: const ProfileViewBody(),
    );
  }
}
