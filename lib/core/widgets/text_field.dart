import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/utils/themes.dart';

class CustomTextFormField extends StatelessWidget {
  String text;

  String label;
  TextInputType keyboardType;
  String? Function(String?) validator;
  TextEditingController controller;
  CustomTextFormField({
    super.key,
    required this.text,
    required this.label,
    required this.validator,
    required this.controller,
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
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 40,
            child: TextFormField(
              cursorHeight: 20,
              cursorColor: ColorResources.gry4,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.gry3,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                labelText: label,
                labelStyle: Styles.textStyle12,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              validator: validator,
              keyboardType: keyboardType,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
