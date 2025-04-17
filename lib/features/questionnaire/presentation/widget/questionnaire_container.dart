import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/themes.dart';

import '../../../../core/utils/color_resources.dart';

class QuestionContainer extends StatelessWidget {
  final String question;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onSelected;
  final bool showCorrectAnswer;
  final String correctAnswer;
  final  bool isDisabled;

  const QuestionContainer({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
    this.selectedOption,
    this.showCorrectAnswer = false, // Default to false
    required this.correctAnswer,
     this.isDisabled = false, // Ensure this is required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: Styles.textStyle15,),
          const SizedBox(height: 10),
          Column(
            children: options.map((option) {
              bool isCorrect = showCorrectAnswer && option == correctAnswer;
              return RadioListTile<String>(
                title: Text(option,
                  style: Styles.textStyle14Regular.copyWith(
                    color: showCorrectAnswer
                        ? (isCorrect ? Colors.green : Colors.red)
                        : Colors.white, // Default text color

                  ),),
                // activeColor: ColorResources.softWhite,
                fillColor: WidgetStatePropertyAll(ColorResources.softWhite),
                value: option,
                groupValue: selectedOption, // Pre-select correct answer if applicable
                onChanged: showCorrectAnswer
                 ? null
                : (value) => onSelected(value!),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
