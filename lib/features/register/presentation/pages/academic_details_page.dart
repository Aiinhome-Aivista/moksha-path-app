import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/register/domain/entities/academic_item.dart';
import 'package:moksha_path/features/register/domain/entities/academic_year.dart';
import 'package:moksha_path/features/register/presentation/bloc/register_bloc.dart';
import 'package:moksha_path/features/register/presentation/pages/select_subjects_page.dart';
import 'package:moksha_path/features/register/presentation/widgets/academic_dropdown_field.dart';
import 'package:moksha_path/features/register/presentation/widgets/academic_dropdown_list.dart';
import 'package:moksha_path/features/register/presentation/widgets/academic_action_buttons.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class AcademicDetailsPage extends StatefulWidget {
  const AcademicDetailsPage({super.key});

  @override
  State<AcademicDetailsPage> createState() => _AcademicDetailsPageState();
}

class _AcademicDetailsPageState extends State<AcademicDetailsPage> {
  final _boardCtrl = TextEditingController();
  final _schoolCtrl = TextEditingController();
  final _classCtrl = TextEditingController();
  final _yearCtrl = TextEditingController();

  List<AcademicItem> _boards = [], _schools = [], _classes = [];
  List<AcademicYear> _years = [];
  bool _showBoards = false,
      _showSchools = false,
      _showClasses = false,
      _showYears = false;
  int? _selectedBoardId, _selectedSchoolId, _selectedClassId;

  @override
  void initState() {
    super.initState();
    context.read<RegisterBloc>().add(BoardsFetched());
  }

  @override
  void dispose() {
    for (final c in [_boardCtrl, _schoolCtrl, _classCtrl, _yearCtrl]) {
      c.dispose();
    }
    super.dispose();
  }

  void _resetFrom(String level) {
    if (level == 'school' || level == 'all') {
      _schoolCtrl.clear();
      _selectedSchoolId = null;
      _schools = [];
      _showSchools = false;
    }
    if (level == 'class' || level == 'school' || level == 'all') {
      _classCtrl.clear();
      _selectedClassId = null;
      _classes = [];
      _showClasses = false;
    }
    if (level == 'year' ||
        level == 'class' ||
        level == 'school' ||
        level == 'all') {
      _yearCtrl.clear();
      _years = [];
      _showYears = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: _onStateChange,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Academic Details', style: AppTextStyles.h1(context)),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: AppTheme.of(context).primary,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'You have been successfully signed-in.',
                        style: AppTextStyles.body(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Please provide the following details to opt for your subscription.',
                  style: AppTextStyles.body(context),
                ),
                const SizedBox(height: 32),

                // 1. Board
                AcademicDropdownField(
                  label: 'Select Board',
                  controller: _boardCtrl,
                  onTap: () => setState(() => _showBoards = !_showBoards),
                ),
                if (_showBoards)
                  AcademicItemDropdownList(
                    items: _boards,
                    onSelect: (item) {
                      _boardCtrl.text = item.name;
                      _selectedBoardId = item.id;
                      _resetFrom('school');
                      setState(() => _showBoards = false);
                      context.read<RegisterBloc>().add(SchoolsFetched(item.id));
                    },
                  ),
                const SizedBox(height: 24),

                // 2. School
                AcademicDropdownField(
                  label: 'Your School/College/University',
                  controller: _schoolCtrl,
                  subtitle: 'Full name required',
                  onTap: () {
                    if (_selectedBoardId != null) {
                      setState(() => _showSchools = !_showSchools);
                    }
                  },
                ),
                if (_showSchools)
                  AcademicItemDropdownList(
                    items: _schools,
                    onSelect: (item) {
                      _schoolCtrl.text = item.name;
                      _selectedSchoolId = item.id;
                      _resetFrom('class');
                      setState(() => _showSchools = false);
                      context.read<RegisterBloc>().add(
                        ClassesFetched(
                          boardId: _selectedBoardId!,
                          schoolId: item.id,
                        ),
                      );
                    },
                  ),
                const SizedBox(height: 24),

                // 3. Class
                AcademicDropdownField(
                  label: 'Class/Standard',
                  controller: _classCtrl,
                  onTap: () {
                    if (_selectedSchoolId != null) {
                      setState(() => _showClasses = !_showClasses);
                    }
                  },
                ),
                if (_showClasses)
                  AcademicItemDropdownList(
                    items: _classes,
                    onSelect: (item) {
                      _classCtrl.text = item.name;
                      _selectedClassId = item.id;
                      _resetFrom('year');
                      setState(() => _showClasses = false);
                      context.read<RegisterBloc>().add(
                        YearsFetched(
                          boardId: _selectedBoardId!,
                          schoolId: _selectedSchoolId!,
                          classId: item.id,
                        ),
                      );
                    },
                  ),
                const SizedBox(height: 24),

                // 4. Year
                AcademicDropdownField(
                  label: 'Academic Year',
                  controller: _yearCtrl,
                  subtitle: 'Year of course start',
                  onTap: () {
                    if (_selectedClassId != null) {
                      setState(() => _showYears = !_showYears);
                    }
                  },
                ),
                if (_showYears)
                  AcademicYearDropdownList(
                    items: _years,
                    onSelect: (year) {
                      _yearCtrl.text = year.year;
                      setState(() => _showYears = false);
                    },
                  ),
                const SizedBox(height: 40),

                // Actions
                AcademicActionButtons(
                  onSkip: () => Navigator.pop(context),
                  onSelectSubjects: () {
                    if (_selectedBoardId == null ||
                        _selectedSchoolId == null ||
                        _selectedClassId == null ||
                        _yearCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                      return;
                    }
                    final bloc = context.read<RegisterBloc>();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: bloc,
                          child: SelectSubjectsPage(
                            boardId: _selectedBoardId!,
                            schoolId: _selectedSchoolId!,
                            classId: _selectedClassId!,
                            academicYear: _yearCtrl.text,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onStateChange(BuildContext context, RegisterState state) {
    if (state is BoardsLoadSuccess) {
      setState(() {
        _boards = state.boards;
        _showBoards = true;
      });
    }
    if (state is BoardsLoadFailure) {
      _snack('Boards: ${state.error}');
    }
    if (state is SchoolsLoadSuccess) {
      setState(() {
        _schools = state.schools;
        _showSchools = true;
      });
    }
    if (state is SchoolsLoadFailure) {
      _snack('Schools: ${state.error}');
    }
    if (state is ClassesLoadSuccess) {
      setState(() {
        _classes = state.classes;
        _showClasses = true;
      });
    }
    if (state is ClassesLoadFailure) {
      _snack('Classes: ${state.error}');
    }
    if (state is YearsLoadSuccess) {
      setState(() {
        _years = state.years;
        _showYears = true;
      });
    }
    if (state is YearsLoadFailure) {
      _snack('Years: ${state.error}');
    }
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
