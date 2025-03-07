import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

import '../../../../core/utils/themes.dart';

class BuildProfileForm extends StatelessWidget {
  const BuildProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _buildTextField(label: 'Full Name', icon: Icons.person),
          const SizedBox(height: 15),
          _buildTextField(label: 'Phone No', icon: Icons.phone),
          const SizedBox(height: 15),
          _buildTextField(label: 'Email', icon: Icons.email),
          const SizedBox(height: 15),
          _buildTextField(label: 'Faculty', icon: Icons.school),
          const SizedBox(height: 15),
          _buildTextField(label: 'Major', icon: Icons.book),
          const SizedBox(height: 15),
          _buildTextField(label: 'Graduation Year', icon: Icons.calendar_today),
          const SizedBox(height: 15),
          _buildTextField(label: 'Graduation Status', icon: Icons.check_circle),
        ],
      ),
    );
  }
}

Widget _buildTextField({
  required String label,
  required IconData icon,
  bool isPassword = false,
}) {
  return TextFormField(

    obscureText: isPassword,
    cursorHeight: 15,
    cursorColor: ColorResources.neutralGray,


    decoration: InputDecoration(

      labelText: label,
      labelStyle: Styles.textStyle12.copyWith(color: Colors.white),
      prefixIcon: Icon(icon , color: Colors.white,),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white),

      ),

    ),
    style:  TextStyle(color:Colors.white),
  );
}
