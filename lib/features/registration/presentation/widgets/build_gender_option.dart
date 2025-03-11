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
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Gender', style: Styles.textStyle13,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildGenderOption('Male'),
            const SizedBox(width: 20),
            buildGenderOption('Female'),
          ],
        ),
      ],
    );
  }

  Widget buildGenderOption(String gender) {
    final isSelected = _selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
          widget.onGenderSelected(gender); // Notify parent widget
        });
      },
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorResources.darkMauve,
                width: 2,
              ),
              color: isSelected ? ColorResources.softWhite : Colors.transparent,
            ),
            child: isSelected
                ? Icon(
              Icons.check,
              size: 10,
              color: ColorResources.darkMauve,
            )
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            gender,
            style: Styles.textStyle13,
          ),
        ],
      ),
    );
  }
}
