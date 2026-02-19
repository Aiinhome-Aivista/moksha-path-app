import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class MokshaFloatingActionButton extends StatelessWidget {
  const MokshaFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppTheme.of(context).secondary,
      child: const Icon(Icons.chat_bubble, color: Colors.white),
    );
  }
}
