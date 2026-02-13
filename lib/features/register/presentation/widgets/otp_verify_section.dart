import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class OtpVerifySection extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController fieldController;
  final TextInputType keyboardType;
  final bool isVerified;
  final bool showOtp;
  final String otpLabel;
  final List<TextEditingController> otpControllers;
  final List<FocusNode> otpFocusNodes;
  final VoidCallback onVerifyTap;
  final VoidCallback onConfirmOtp;
  final VoidCallback onResendOtp;

  const OtpVerifySection({
    super.key,
    required this.label,
    required this.hintText,
    required this.fieldController,
    required this.keyboardType,
    required this.isVerified,
    required this.showOtp,
    required this.otpLabel,
    required this.otpControllers,
    required this.otpFocusNodes,
    required this.onVerifyTap,
    required this.onConfirmOtp,
    required this.onResendOtp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledTextField(
          label: label,
          hintText: hintText,
          controller: fieldController,
          keyboardType: keyboardType,
          suffix: isVerified
              ? const Icon(Icons.check_circle, color: Colors.green)
              : GlobalChip(text: 'Verify', isActive: true, onTap: onVerifyTap),
        ),

        if (showOtp && !isVerified) ...[
          const SizedBox(height: 16),
          Text(
            otpLabel,
            style: AppTextStyles.body(context).copyWith(fontSize: 13),
          ),
          const SizedBox(height: 8),
          _buildOtpBoxes(context),
          const SizedBox(height: 8),
          Row(
            children: [
              GlobalChip(text: 'Confirm', isActive: true, onTap: onConfirmOtp),
              const SizedBox(width: 12),
              GlobalChip(text: 'Resend', isActive: false, onTap: onResendOtp),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildOtpBoxes(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(6, (i) {
        return Container(
          width: 42,
          height: 48,
          margin: const EdgeInsets.only(right: 8),
          child: TextField(
            controller: otpControllers[i],
            focusNode: otpFocusNodes[i],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppTheme.of(context).primary,
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty && i < 5) {
                otpFocusNodes[i + 1].requestFocus();
              } else if (value.isEmpty && i > 0) {
                otpFocusNodes[i - 1].requestFocus();
              }
            },
          ),
        );
      }),
    );
  }
}
