import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';

class AcademicActionButtons extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onSelectSubjects;

  const AcademicActionButtons({
    super.key,
    required this.onSkip,
    required this.onSelectSubjects,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlobalChip(text: 'Skip for now', isActive: false, onTap: onSkip),
        const SizedBox(width: 16),
        GlobalChip(
          text: 'Select Subjects',
          isActive: true,
          onTap: onSelectSubjects,
        ),
      ],
    );
  }
}
