import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/boards_bloc.dart';
import '../../presentation/pages/boards_page.dart';

class BoardsRootPage extends StatelessWidget {
  const BoardsRootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BoardsBloc(),
      child: const BoardsPage(),
    );
  }
}