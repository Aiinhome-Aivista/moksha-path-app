import 'package:flutter/material.dart';

class GlobalSegmentedToggle extends StatelessWidget {
  final bool value; // true = left, false = right
  final ValueChanged<bool> onChanged;

  // Labels (optional)
  final String? leftText;
  final String? rightText;

  // Icons (optional)
  final IconData? leftIcon;
  final IconData? rightIcon;

  // Size
  final double width;
  final double height;
  final EdgeInsets padding;

  // Colors
  final Color backgroundColor;
  final Color leftActiveColor;
  final Color rightActiveColor;
  final Color activeContentColor;
  final Color inactiveContentColor;

  // Animation
  final Duration duration;
  final Curve curve;

  const GlobalSegmentedToggle({
    super.key,
    required this.value,
    required this.onChanged,

    // Optional content
    this.leftText,
    this.rightText,
    this.leftIcon,
    this.rightIcon,

    // Size
    this.width = 160,
    this.height = 44,
    this.padding = const EdgeInsets.all(4),

    // Colors (image-matched defaults)
    this.backgroundColor = const Color(0xFFBDBDBD),
    this.leftActiveColor = const Color(0xFF2E7D32), // green
    this.rightActiveColor = const Color(0xFFC62828), // red
    this.activeContentColor = Colors.white,
    this.inactiveContentColor = Colors.white70,

    // Animation
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    final segmentWidth = (width - padding.horizontal) / 2;

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Stack(
        children: [
          /// Sliding active segment
          AnimatedAlign(
            duration: duration,
            curve: curve,
            alignment: value ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: segmentWidth,
              height: height - padding.vertical,
              decoration: BoxDecoration(
                color: value ? leftActiveColor : rightActiveColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
          ),

          /// Content
          Row(
            children: [
              _buildItem(
                isActive: value,
                text: leftText,
                icon: leftIcon,
                onTap: () => onChanged(true),
              ),
              _buildItem(
                isActive: !value,
                text: rightText,
                icon: rightIcon,
                onTap: () => onChanged(false),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required bool isActive,
    required VoidCallback onTap,
    String? text,
    IconData? icon,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: duration,
            style: TextStyle(
              color: isActive ? activeContentColor : inactiveContentColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 18,
                    color: isActive ? activeContentColor : inactiveContentColor,
                  ),
                if (icon != null && text != null) const SizedBox(width: 6),
                if (text != null) Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
