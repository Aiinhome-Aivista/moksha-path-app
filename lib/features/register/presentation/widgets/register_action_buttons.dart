import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class RegisterActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onLogin;
  final VoidCallback onSignIn;

  const RegisterActionButtons({
    super.key,
    required this.onCancel,
    required this.onLogin,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GlobalChip(text: 'Cancel', isActive: false, onTap: onCancel),
            const SizedBox(width: 16),
            GlobalChip(text: 'Login', isActive: true, onTap: onLogin),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Text('Have an account?', style: AppTextStyles.body(context)),
            TextButton(
              onPressed: onSignIn,
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
    );
  }
}
