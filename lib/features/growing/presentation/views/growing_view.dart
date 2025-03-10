import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/custom_app_bar.dart';
import '../widgets/growing_view_body.dart';

class GrowingView extends StatelessWidget {
  const GrowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppBar(

      ),
      body:  const GrowingViewBody(),
    );
  }
}
