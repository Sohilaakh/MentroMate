import 'package:flutter/cupertino.dart';

import '../../../../core/utils/themes.dart';


class ContinueAsGuestText extends StatelessWidget {
  final VoidCallback onTap;

  const ContinueAsGuestText({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Text(
        'Continue as a guest >>',
        textAlign: TextAlign.center,

          style: Styles.textStyle20,


      ),
    );
  }
}