import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class QuestionContainer extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(String) onSelected;

  const QuestionContainer({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
  });

  @override
  State<QuestionContainer> createState() => _QuestionContainerState();
}

class _QuestionContainerState extends State<QuestionContainer> {
  String? selectedOption;

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
          Text(
            widget.question
          ),

          const SizedBox(height: 10),

          ...widget.options.map((option) {
            return RadioListTile<String>(
              title: Text(option, style: const TextStyle(color: Colors.white)),
              value: option,
              groupValue: selectedOption,
              activeColor: Colors.purpleAccent,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onSelected(value!);
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
