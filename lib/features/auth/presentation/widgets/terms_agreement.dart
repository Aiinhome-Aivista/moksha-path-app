import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

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
