import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/auth/presentation/bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: const Center(child: Text('Auth Page')),
      floatingActionButton: Column(
         mainAxisAlignment: MainAxisAlignment.end,
        children: [
       
        FloatingActionButton(onPressed: (){context.read<AuthBloc>().add(AcademicMastersFetched()); }, child: Icon(Icons.refresh),)
      ],),
    );
  }
}