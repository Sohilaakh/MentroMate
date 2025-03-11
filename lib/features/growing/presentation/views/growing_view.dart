import 'package:flutter/material.dart';

import '../widgets/growing_view_body.dart';

class GrowingView extends StatelessWidget {
  const GrowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GrowingViewBody()
      ],
    );
  }
}
