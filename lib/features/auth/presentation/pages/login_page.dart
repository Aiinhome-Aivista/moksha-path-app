import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';
import 'package:moksha_path/features/auth/presentation/widgets/tab_toggle.dart';
import 'package:moksha_path/features/register/presentation/pages/register_root_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailSelected = true;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  @override
  void dispose() {
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
              Text('Sign In to Your Account', style: AppTextStyles.h1(context)),
              const SizedBox(height: 32),

              // Username Field
              LabeledTextField(
                label: 'Username',
                hintText: 'Enter your username',
                controller: _usernameController,
              ),
              const SizedBox(height: 8),

              // Forgot Credential Link
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => debugPrint('Forgot Credential tapped'),
                  child: Text(
                    'Forgot Credential?',
                    style: AppTextStyles.body(
                      context,
                    ).copyWith(color: AppTheme.of(context).primary),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Email/Mobile Tab Toggle
              TabToggle(
                isEmailSelected: isEmailSelected,
                onChanged: (val) => setState(() => isEmailSelected = val),
              ),
              const SizedBox(height: 16),

              // Email or Mobile Field
              if (isEmailSelected)
                LabeledTextField(
                  label: 'E-mail ID',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  suffix: GlobalChip(
                    text: 'Send OTP',
                    isActive: true,
                    onTap: () => debugPrint('Send OTP Email'),
                  ),
                )
              else
                LabeledTextField(
                  label: 'Mobile',
                  hintText: 'Enter your mobile',
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  suffix: GlobalChip(
                    text: 'Send OTP',
                    isActive: true,
                    onTap: () => debugPrint('Send OTP Mobile'),
                  ),
                ),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  GlobalChip(
                    text: 'Back',
                    isActive: true,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  GlobalChip(
                    text: 'Cancel',
                    isActive: true,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  GlobalChip(
                    text: 'Sign In',
                    isActive: true,
                    onTap: () => debugPrint('Sign In'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Create Account Link
              Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyles.body(context),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterRootPage(),
                      ),
                    ),
                    child: Text(
                      'Create an account',
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
