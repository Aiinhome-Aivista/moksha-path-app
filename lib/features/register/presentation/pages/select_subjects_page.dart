import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class SelectSubjectsPage extends StatefulWidget {
  const SelectSubjectsPage({super.key});

  @override
  State<SelectSubjectsPage> createState() => _SelectSubjectsPageState();
}

class _SelectSubjectsPageState extends State<SelectSubjectsPage> {
  final List<String> _subjects = [
    'Math',
    'Science',
    'History',
    'Civics',
    'Geography',
    'English Literature',
    'English Grammar',
    'Hindi Sahitya',
    'Hindi Yekeran',
  ];

  final Set<String> _selectedSubjects = {};

  void _toggleSubject(String subject) {
    setState(() {
      if (_selectedSubjects.contains(subject)) {
        _selectedSubjects.remove(subject);
      } else {
        _selectedSubjects.add(subject);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Select Subjects', style: AppTextStyles.h1(context)),
              const SizedBox(height: 16),

              Text(
                'Please select the subjects you want to access and evaluate your-self. We will present the subscriptions based on your selections.',
                style: AppTextStyles.body(context),
              ),
              const SizedBox(height: 32),

              // Subject Chips
              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: _subjects.map((subject) {
                  final isSelected = _selectedSubjects.contains(subject);
                  return GlobalChip(
                    text: subject,
                    isActive: isSelected,
                    onTap: () => _toggleSubject(subject),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),

              // Action Buttons
              Row(
                children: [
                  GlobalChip(
                    text: 'Skip for now',
                    isActive: false,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  GlobalChip(
                    text: 'Subscribe',
                    isActive: true,
                    onTap: () =>
                        debugPrint('Subscribe tapped: $_selectedSubjects'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
