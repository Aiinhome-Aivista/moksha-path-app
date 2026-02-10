import 'package:flutter/material.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

/// Reusable text field with label for forms
class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool showDropdown;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.suffix,
    this.showDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: const UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  suffixIcon: showDropdown
                      ? Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600)
                      : null,
                ),
              ),
            ),
            if (suffix != null) ...[
              const SizedBox(width: 8),
              suffix!,
            ],
          ],
        ),
      ],
    );
  }
}

/// Terms and privacy policy widget
class TermsAgreementWidget extends StatelessWidget {
  const TermsAgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I have read and agreed to the application\'s',
          style: AppTextStyles.body(context),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.check, color: AppTheme.of(context).primary, size: 16),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => debugPrint('Privacy Policy tapped'),
              child: Text(
                'Privacy Policy',
                style: AppTextStyles.body(context).copyWith(
                  color: AppTheme.of(context).primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text('  &  ', style: AppTextStyles.body(context)),
            Icon(Icons.check, color: AppTheme.of(context).primary, size: 16),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => debugPrint('Terms of Service tapped'),
              child: Text(
                'Terms of Service',
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
