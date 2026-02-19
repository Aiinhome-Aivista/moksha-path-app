import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/learning_plan_bloc.dart';
import '../../presentation/pages/learning_plan_page.dart';

class LearningPlanRootPage extends StatelessWidget {
  const LearningPlanRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LearningPlanBloc(),
      child: const LearningPlannerScreen(),
    );
  }
}
