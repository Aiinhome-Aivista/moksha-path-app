import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:moksha_path/features/auth/presentation/pages/login_page.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    // Fetch roles when page loads
    context.read<AuthBloc>().add(RolesFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBarTheme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are you a', style: AppTextStyles.h1(context)),
            const SizedBox(height: 10),
            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) =>
                  current is RolesLoadInProgress ||
                  current is RolesLoadSuccess ||
                  current is RolesLoadFailure,
              builder: (context, state) {
                if (state is RolesLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RolesLoadSuccess) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: state.roles.map((role) {
                      final isSelected = state.selectedRoleId == role.roleId;
                      return GlobalChip(
                        text: role.roleName,
                        isActive: isSelected,
                        onTap: () {
                          context.read<AuthBloc>().add(
                            RoleSelected(role.roleId),
                          );
                        },
                      );
                    }).toList(),
                  );
                } else if (state is RolesLoadFailure) {
                  return Text(
                    'Error loading roles: ${state.error}',
                    style: TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Please choose as whom you want to interact with this platform',
              style: AppTextStyles.body(context),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                GlobalChip(
                  text: 'Cancel',
                  isActive: false,
                  onTap: () {
                    debugPrint('pressed cancel');
                  },
                ),
                const SizedBox(width: 12),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) => current is RolesLoadSuccess,
                  builder: (context, state) {
                    final isEnabled =
                        state is RolesLoadSuccess &&
                        state.selectedRoleId != null;
                    return GlobalChip(
                      text: 'Next',
                      isActive: isEnabled,
                      onTap: () {
                        if (isEnabled) {
                          // Handle next action with selected role
                          debugPrint('pressed next');
                          final bloc = context.read<AuthBloc>();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: bloc,
                                child: const LoginPage(),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         context.read<AuthBloc>().add(AcademicMastersFetched());
      //       },
      //       child: Icon(Icons.refresh),
      //     ),
      //   ],
      // ),
    );
  }
}
