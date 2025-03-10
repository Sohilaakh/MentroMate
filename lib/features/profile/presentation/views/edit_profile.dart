import 'package:flutter/material.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widgets/update_profile_view_body.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      LinearGradientBackGroundColor(
        beginColor: Alignment.bottomLeft,
        endColor: Alignment.topRight,
      ),
      Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          foregroundColor: Colors.white,

        ),
        backgroundColor: Colors.transparent,
        body:  UpdateProfileViewBody(),
      ),
    ]);
  }
}
