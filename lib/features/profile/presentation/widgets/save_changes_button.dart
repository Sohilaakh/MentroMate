import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class SaveChangesButton extends StatelessWidget {
  const SaveChangesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor:ColorResources.softWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )
        ),
        child:
             Text('Save Changes', style: TextStyle(color: ColorResources.deepPink)),
      ),
    );
  }
}
