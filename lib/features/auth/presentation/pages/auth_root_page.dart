import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/di/service_locator.dart';
import 'package:moksha_path/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:moksha_path/features/auth/presentation/bloc/role_bloc.dart';
import 'package:moksha_path/features/auth/presentation/pages/auth_page.dart';

class AuthRootPage extends StatelessWidget {
  const AuthRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(sl())),
        BlocProvider(create: (_) => RoleBloc(sl())),
      ],
      child: const AuthPage(),
    );
  }
}
