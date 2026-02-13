import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';

class NameFieldSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onGetSuggestions;

  const NameFieldSection({
    super.key,
    required this.controller,
    required this.onGetSuggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledTextField(
          label: 'Your Name',
          hintText: 'Enter',
          controller: controller,
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: GlobalChip(
            text: 'Get Suggestions',
            isActive: true,
            onTap: onGetSuggestions,
          ),
        ),
      ],
    );
  }
}
