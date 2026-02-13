import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/user_profile_bloc.dart';
import '../../presentation/pages/user_profile_page.dart';

class UserProfileRootPage extends StatelessWidget {
  const UserProfileRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileBloc(),
      child: const UserProfilePage(),
    );
  }
}