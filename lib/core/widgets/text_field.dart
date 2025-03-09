import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final bool obscureText;
   Color? color = ColorResources.lightGray;
  final Widget? suffixIcon;
  final IconData? icon ;

    CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.text,
    required this.label,
    required this.validator,
    required this.controller,
    this.icon,
    this.suffixIcon,
    this.color,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Styles.textStyle14,
          ),
          const SizedBox(height: 5),
          TextFormField(

            obscureText: obscureText,
            cursorHeight: 15,
            cursorColor: ColorResources.neutralGray,
            decoration: InputDecoration(
              prefixIcon: Icon(icon , color: Colors.white,),

              filled: true,
              fillColor: color,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red),
              ),
              labelText: label,
              labelStyle: Styles.textStyle12,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              errorStyle: Styles.textStyle12.copyWith(color: Colors.red),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: suffixIcon,
            ),
            validator: validator,
            keyboardType: keyboardType,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
