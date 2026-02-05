import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      appBar: AppBar(title: const Text('Setting')),
      body:  Center(child: Text('Setting Page', style: AppTextStyles.h1(context))),
    );
  }
}