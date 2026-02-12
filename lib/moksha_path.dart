import 'package:flutter/material.dart';
import 'package:moksha_path/core/di/service_locator.dart';
import 'package:moksha_path/features/auth/presentation/pages/auth_root_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MokshaPath());
}

class MokshaPath extends StatelessWidget {
  const MokshaPath({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      tokens: lightThemeTokens,
      child: MaterialApp(home: const AuthRootPage()),
    );
  }
}
