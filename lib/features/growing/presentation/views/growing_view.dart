import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../widgets/growing_view_body.dart';

class GrowingView extends StatelessWidget {
  const GrowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(
        icon: Icon(
          Icons.menu,
          color: ColorResources.softWhite,
          size: 30,
        ),
      ),
      body: const GrowingViewBody(),
    );
  }
}
