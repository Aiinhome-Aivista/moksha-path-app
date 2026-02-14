import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/dashboard_bloc.dart';
import '../../presentation/pages/dashboard_page.dart';

class DashboardRootPage extends StatelessWidget {
  const DashboardRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: const DashboardPage(),
    );
  }
}