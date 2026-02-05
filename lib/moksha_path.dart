import 'package:flutter/material.dart';
import 'package:moksha_path/features/setting/presentation/pages/setting_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

void main() {
  runApp(const MokshaPath());
}

class MokshaPath extends StatelessWidget {
  const MokshaPath({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp( 
          home: AppTheme(
            tokens: lightThemeTokens, 
            child: SettingPage()
            ),
            );
  }
}


