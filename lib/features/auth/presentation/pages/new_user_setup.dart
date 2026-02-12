import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';
import 'package:moksha_path/features/auth/presentation/widgets/terms_agreement.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class NewUserSetupPage extends StatefulWidget {
  const NewUserSetupPage({super.key});

  @override
  State<NewUserSetupPage> createState() => _NewUserSetupPageState();
}

class _NewUserSetupPageState extends State<NewUserSetupPage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
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
              Text('New User Setup', style: AppTextStyles.h1(context)),
              const SizedBox(height: 32),

              // Your Name
              LabeledTextField(
                label: 'Your Name',
                hintText: 'Enter',
                controller: _nameController,
              ),
              const SizedBox(height: 24),

              // Username
              LabeledTextField(
                label: 'Username',
                hintText: 'Select or type username',
                controller: _usernameController,
                showDropdown: true,
              ),
              const SizedBox(height: 24),

              // E-mail ID with Verify
              LabeledTextField(
                label: 'E-mail ID',
                hintText: 'Select',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                suffix: GlobalChip(
                  text: 'Verify',
                  isActive: true,
                  onTap: () => debugPrint('Verify Email'),
                ),
              ),
              const SizedBox(height: 24),

              // Mobile with Verify
              LabeledTextField(
                label: 'Mobile',
                hintText: '1234567890',
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                suffix: GlobalChip(
                  text: 'Verify',
                  isActive: true,
                  onTap: () => debugPrint('Verify Mobile'),
                ),
              ),
              const SizedBox(height: 32),

              // Terms Agreement
              const TermsAgreementWidget(),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  GlobalChip(
                    text: 'Cancel',
                    isActive: false,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  GlobalChip(
                    text: 'Login',
                    isActive: true,
                    onTap: () => debugPrint('Login tapped'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Sign In Link
              Row(
                children: [
                  Text('Have an account?', style: AppTextStyles.body(context)),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Sign-in',
                      style: AppTextStyles.body(context).copyWith(
                        color: AppTheme.of(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
