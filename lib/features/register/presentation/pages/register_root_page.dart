import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/di/service_locator.dart';
import '../../presentation/bloc/register_bloc.dart';
import '../../presentation/pages/register_page.dart';

class RegisterRootPage extends StatelessWidget {
  const RegisterRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(sl(), sl(), sl(), sl(), sl()),
      child: const RegisterPage(),
    );
  }
}
