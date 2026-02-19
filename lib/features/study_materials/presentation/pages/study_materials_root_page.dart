import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/study_materials_bloc.dart';
import '../../presentation/pages/study_materials_page.dart';

class StudyMaterialsRootPage extends StatelessWidget {
  const StudyMaterialsRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StudyMaterialsBloc(),
      child: const StudyMaterialsPage(),
    );
  }
}