import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:moksha_path/core/di/service_locator.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/auth/data/datasources/roles_remote_data_source.dart';
import 'package:moksha_path/features/auth/presentation/pages/auth_root_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dioClient = DioClient();
  final rolesDataSource = RolesRemoteDataSourceImpl(dioClient);

  final roles = await rolesDataSource.fetchRoles();
  // print(roles);
  await setupLocator();
  runApp(const MokshaPath());
}

class MokshaPath extends StatelessWidget {
  const MokshaPath({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppTheme(tokens: lightThemeTokens, child: AuthRootPage()),
    );
  }
}
