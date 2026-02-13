import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';

class AcademicDropdownField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onTap;
  final String? subtitle;

  const AcademicDropdownField({
    super.key,
    required this.label,
    required this.controller,
    required this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: AbsorbPointer(
            child: LabeledTextField(
              label: label,
              hintText: 'Type here',
              controller: controller,
              showDropdown: true,
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
