import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';
import '../bloc/setting_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      appBar: AppBar(
        title: const Text('Academic Masters'),
        backgroundColor: AppTheme.of(context).primary,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          if (state is SettingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SettingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.error}',
                    style: AppTextStyles.h3(context),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SettingBloc>().add(
                        FetchAcademicMastersEvent(),
                      );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is SettingSuccess) {
            final boards = state.boards;

            if (boards.isEmpty) {
              return Center(
                child: Text(
                  'No boards available',
                  style: AppTextStyles.h2(context),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<SettingBloc>().add(FetchAcademicMastersEvent());
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: boards.length,
                itemBuilder: (context, index) {
                  final board = boards[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.of(context).primary,
                        foregroundColor: Colors.white,
                        child: Text(
                          board.id.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(board.name, style: AppTextStyles.h3(context)),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppTheme.of(context).primary,
                      ),
                      onTap: () {
                        // Handle board selection
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: ${board.name}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }

          return Center(
            child: Text(
              'Pull down to refresh',
              style: AppTextStyles.h2(context),
            ),
          );
        },
      ),
    );
  }
}
