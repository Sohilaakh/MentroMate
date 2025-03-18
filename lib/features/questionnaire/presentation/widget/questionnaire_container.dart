import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';

class QuestionContainer extends StatelessWidget {
  final String question;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelected;

  const QuestionContainer({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
    this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorResources.softWhite1,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question),
          const SizedBox(height: 10),
          Column(
            children: options.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedOption, // Pre-select correct answer if applicable
                onChanged: (value) {
                  if (selectedOption == null) { // Prevent changes after score is shown
                    onSelected(value!);
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
