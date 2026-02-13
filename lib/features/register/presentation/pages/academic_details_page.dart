import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';
import 'package:moksha_path/features/register/presentation/pages/select_subjects_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class AcademicDetailsPage extends StatefulWidget {
  const AcademicDetailsPage({super.key});

  @override
  State<AcademicDetailsPage> createState() => _AcademicDetailsPageState();
}

class _AcademicDetailsPageState extends State<AcademicDetailsPage> {
  final _boardController = TextEditingController();
  final _classController = TextEditingController();
  final _schoolController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  void dispose() {
    _boardController.dispose();
    _classController.dispose();
    _schoolController.dispose();
    _yearController.dispose();
    super.dispose();
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
              Text('Academic Details', style: AppTextStyles.h1(context)),
              const SizedBox(height: 24),

              // Success message
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppTheme.of(context).primary,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You have been successfully signed-in.',
                      style: AppTextStyles.body(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                'Please provide the following details to opt for your subscription.',
                style: AppTextStyles.body(context),
              ),
              const SizedBox(height: 32),

              // Select Board
              LabeledTextField(
                label: 'Select Board',
                hintText: 'Type here',
                controller: _boardController,
                showDropdown: true,
              ),
              const SizedBox(height: 24),

              // Class/Standard
              LabeledTextField(
                label: 'Class/Standard',
                hintText: 'Type here',
                controller: _classController,
                showDropdown: true,
              ),
              const SizedBox(height: 24),

              // Your School/College/University
              LabeledTextField(
                label: 'Your School/College/University',
                hintText: 'Type here',
                controller: _schoolController,
                showDropdown: true,
              ),
              const SizedBox(height: 4),
              Text(
                'Full name required',
                style: AppTextStyles.body(
                  context,
                ).copyWith(color: AppTheme.of(context).primary, fontSize: 12),
              ),
              const SizedBox(height: 24),

              // Academic Year
              LabeledTextField(
                label: 'Academic Year',
                hintText: 'Type here',
                controller: _yearController,
                showDropdown: true,
              ),
              const SizedBox(height: 4),
              Text(
                'Year of course start',
                style: AppTextStyles.body(
                  context,
                ).copyWith(color: AppTheme.of(context).primary, fontSize: 12),
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
                    text: 'Select Subjects',
                    isActive: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectSubjectsPage(),
                        ),
                      );
                      debugPrint('Select Subjects tapped');
                    },
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
