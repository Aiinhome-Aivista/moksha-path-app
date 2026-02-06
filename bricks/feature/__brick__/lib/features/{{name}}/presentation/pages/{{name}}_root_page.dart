import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/bloc/{{name}}_bloc.dart';
import '../../presentation/pages/{{name}}_page.dart';

class {{name.pascalCase()}}RootPage extends StatelessWidget {
  const {{name.pascalCase()}}RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => {{name.pascalCase()}}Bloc(),
      child: const {{name.pascalCase()}}Page(),
    );
  }
}