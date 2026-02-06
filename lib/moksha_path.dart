import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:moksha_path/features/setting/data/repositories/setting_repo_impl.dart';
import 'package:moksha_path/features/setting/domain/usecases/get_setting.dart';
import 'package:moksha_path/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:moksha_path/features/setting/presentation/pages/setting_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

void main() {
  runApp(const MokshaPath());
}

// Replace this with your actual bearer token
const String bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzNiIsIm5hbWUiOiJTYW5jaGFyaSBLYXJtYWthciIsInVzZXJuYW1lIjoic2FuY2hhcmlrYXJtYWthcjMwMyIsInJvbGVzIjpudWxsLCJzaWQiOiI2MyIsImV4cCI6MTc3MDQ0ODkzMH0.poWumFAXrpdUc84C2UIxQGNbZv1ykDQtNv4O7Vsg2wg';

class MokshaPath extends StatelessWidget {
  const MokshaPath({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingBloc(
            GetSetting(
              SettingRepoImpl(
                SettingRemoteDataSourceImpl(DioClient(token: bearerToken)),
              ),
            ),
          )..add(FetchAcademicMastersEvent()),
        ),
      ],
      child: MaterialApp(
        home: AppTheme(tokens: lightThemeTokens, child: SettingPage()),
      ),
    );
  }
}
