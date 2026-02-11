import 'package:flutter/material.dart';

class GlobalChip extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  // Colors (customizable)
  final Color activeBgColor;
  final Color inactiveBgColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;

  const GlobalChip({
    super.key,
    required this.text,
    required this.isActive,
    required this.onTap,
    this.activeBgColor = const Color(0xFF0A6C74),
    this.inactiveBgColor = const Color(0xFFF1F1F1),
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = Colors.black87,
    this.activeBorderColor = const Color(0xFF0A6C74),
    this.inactiveBorderColor = const Color(0xFFD0D0D0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? activeBgColor : inactiveBgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? activeBorderColor : inactiveBorderColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? activeTextColor : inactiveTextColor,
          ),
        ),
      ),
    );
  }
}
