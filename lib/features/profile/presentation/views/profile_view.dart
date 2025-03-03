import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        icon: Icon(

          Icons.update,
          color: ColorResources.softWhite,
          size: 30,
        ),

      ),
      body: const ProfileView(),
    );
  }
}
