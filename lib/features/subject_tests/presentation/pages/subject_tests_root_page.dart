import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/subject_tests_bloc.dart';
import '../../presentation/pages/subject_tests_page.dart';

class SubjectTestsRootPage extends StatelessWidget {
  const SubjectTestsRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SubjectTestsBloc(),
      child: const SubjectTestsPage(),
    );
  }
}