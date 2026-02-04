import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class SubscriptionMainScreen extends StatelessWidget {
  const SubscriptionMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppTheme.of(context).background,
      body: Center(
        child: Text('Subscription Main Screen', style: AppTextStyles.h1(context)),
      ),
    );
  }
}