import 'package:flutter/material.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/themes.dart';

class GenderPicker extends StatefulWidget {
  final Function(String) onGenderSelected;

  const GenderPicker({super.key, required this.onGenderSelected});

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  String _selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Gender', style: Styles.textStyle13),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildGenderOption(Gender.male, 'Male'),
            const SizedBox(width: 20),
            buildGenderOption(Gender.female, 'Female'),
          ],
        ),
      ],
    );
  }

  Widget buildGenderOption(String gender, String label) {
    final isSelected = _selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
          widget.onGenderSelected(gender);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: ColorResources.darkMauve,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: Styles.textStyle13,
            ),
          ],
        ),
      ),
    );
  }
}

class Gender {
  static const String male = 'male';
  static const String female = 'female';
}
