import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

/// Tab toggle widget for switching between Email and Mobile
class TabToggle extends StatelessWidget {
  final bool isEmailSelected;
  final ValueChanged<bool> onChanged;

  const TabToggle({
    super.key,
    required this.isEmailSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTab(context, 'Email', isEmailSelected, () => onChanged(true)),
        const SizedBox(width: 24),
        _buildTab(context, 'Mobile', !isEmailSelected, () => onChanged(false)),
      ],
    );
  }

  Widget _buildTab(
    BuildContext context,
    String text,
    bool isActive,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: AppTextStyles.body(context).copyWith(
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 50,
            color: isActive ? Colors.black : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
