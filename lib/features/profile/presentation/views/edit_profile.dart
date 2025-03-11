import 'package:flutter/material.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';
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
        body:  UpdateProfileViewBody(),
      ),
    ]);
  }
}
