import 'package:flutter/cupertino.dart';
import '../utils/themes.dart';

class BuildPageText extends StatelessWidget {
  final String title;
  final String? text1;
  final String? text2;

  const BuildPageText({
    super.key,
    required this.title,
    this.text1,
    this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        top: 5.0,
        bottom: 5.0,
        right: 15.0
      ),
      child: Column(
        children: [ Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: Styles.textStyle18,
                ),
                const SizedBox(height: 23),
                if (text1 != null) Text(text1!, style: Styles.textStyle14Regular),
                SizedBox(height: 15),
                if (text2 != null) Text(text2!, style: Styles.textStyle14Regular),
              ],
            ),
          ),
        ), ]
      ),
    );
  }
}
