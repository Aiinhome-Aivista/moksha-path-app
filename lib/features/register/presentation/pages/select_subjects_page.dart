import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/features/register/domain/entities/subject.dart';
import 'package:moksha_path/features/register/presentation/bloc/register_bloc.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class SelectSubjectsPage extends StatefulWidget {
  final int boardId;
  final int schoolId;
  final int classId;
  final String academicYear;

  const SelectSubjectsPage({
    super.key,
    required this.boardId,
    required this.schoolId,
    required this.classId,
    required this.academicYear,
  });

  @override
  State<SelectSubjectsPage> createState() => _SelectSubjectsPageState();
}

class _SelectSubjectsPageState extends State<SelectSubjectsPage> {
  List<Subject> _subjects = [];
  final Set<int> _selectedSubjectIds = {};
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    context.read<RegisterBloc>().add(
      SubjectsFetched(
        boardId: widget.boardId,
        schoolId: widget.schoolId,
        classId: widget.classId,
        academicYear: widget.academicYear,
      ),
    );
  }

  void _toggleSubject(int subjectId) {
    setState(() {
      if (_selectedSubjectIds.contains(subjectId)) {
        _selectedSubjectIds.remove(subjectId);
      } else {
        _selectedSubjectIds.add(subjectId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is SubjectsLoadSuccess) {
            setState(() {
              _subjects = state.subjects;
              _isLoading = false;
              _error = null;
            });
          }
          if (state is SubjectsLoadFailure) {
            setState(() {
              _isLoading = false;
              _error = state.error;
            });
          }
          if (state is SubjectsLoadInProgress) {
            setState(() {
              _isLoading = true;
              _error = null;
            });
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Select Subjects', style: AppTextStyles.h1(context)),
                const SizedBox(height: 16),
                Text(
                  'Please select the subjects you want to access and evaluate your-self. We will present the subscriptions based on your selections.',
                  style: AppTextStyles.body(context),
                ),
                const SizedBox(height: 32),

                // Subject Chips
                if (_isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (_error != null)
                  Text('Error: $_error', style: TextStyle(color: Colors.red))
                else
                  Wrap(
                    spacing: 10,
                    runSpacing: 12,
                    children: _subjects.map((subject) {
                      final isSelected = _selectedSubjectIds.contains(
                        subject.subjectId,
                      );
                      return GlobalChip(
                        text: subject.subjectName,
                        isActive: isSelected,
                        onTap: () => _toggleSubject(subject.subjectId),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 40),

                // Action Buttons
                Row(
                  children: [
                    GlobalChip(
                      text: 'Skip for now',
                      isActive: false,
                      onTap: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 16),
                    GlobalChip(
                      text: 'Subscribe',
                      isActive: true,
                      onTap: () {
                        final selectedNames = _subjects
                            .where(
                              (s) => _selectedSubjectIds.contains(s.subjectId),
                            )
                            .map((s) => s.subjectName)
                            .toList();
                        debugPrint('Subscribe tapped: $selectedNames');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
