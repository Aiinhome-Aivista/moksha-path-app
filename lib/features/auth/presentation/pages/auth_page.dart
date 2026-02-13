import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';
import 'package:moksha_path/features/auth/domain/entities/roles.dart';
import 'package:moksha_path/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:moksha_path/features/widgets/sidebar/side_bar.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      appBar: AppBar(
        title: Text(
          'Auth',
          style: AppTextStyles.h2(context),
        ),
        backgroundColor: AppTheme.of(context).background,
        iconTheme:
            IconThemeData(color: AppTheme.of(context).textPrimary),
      ),
      drawer: const SideNavBar(),

      // 👇 Main Body
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // 🔵 Loading State
          if (state is RolesLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // 🟢 Success State
          if (state is RolesLoadSuccess) {
            final List<Role> roles =
                state.roles;

            if (roles.isEmpty) {
              return const Center(
                child: Text("No boards available"),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: roles.length,
              itemBuilder: (context, index) {
                final role = roles[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(
                      // board.boardName,
                      role.roleName!,
                      style: AppTextStyles.h2(context),
                    ),
                    // subtitle: Text("Board ID: ${board.boardId}"),
                    leading: const Icon(Icons.school),
                  ),
                );
              },
            );
          }

          // 🔴 Error State
          if (state is AcademicBoardsLoadFailure) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // ⚪ Initial State
          return Center(
            child: Text(
              'Press refresh to fetch boards',
              style: AppTextStyles.h1(context),
            ),
          );
        },
      ),

      // 👇 Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AuthBloc>().add(
                RolesFetched(),
              );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}