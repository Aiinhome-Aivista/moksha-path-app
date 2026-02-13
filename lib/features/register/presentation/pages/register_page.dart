import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/register/presentation/bloc/register_bloc.dart';
import 'package:moksha_path/features/register/presentation/pages/academic_details_page.dart';
import 'package:moksha_path/features/register/presentation/widgets/name_field_section.dart';
import 'package:moksha_path/features/register/presentation/widgets/username_section.dart';
import 'package:moksha_path/features/register/presentation/widgets/otp_verify_section.dart';
import 'package:moksha_path/features/register/presentation/widgets/register_action_buttons.dart';
import 'package:moksha_path/features/register/presentation/widgets/terms_agreement.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();

  final _emailOtpCtrls = List.generate(6, (_) => TextEditingController());
  final _mobileOtpCtrls = List.generate(6, (_) => TextEditingController());
  final _emailOtpNodes = List.generate(6, (_) => FocusNode());
  final _mobileOtpNodes = List.generate(6, (_) => FocusNode());

  List<String> _suggestions = [];
  bool _showSuggestions = false,
      _usernameChecked = false,
      _usernameAvailable = false;
  bool _showEmailOtp = false, _emailVerified = false;
  bool _showMobileOtp = false, _mobileVerified = false;
  String _activeOtpType = '';

  @override
  void initState() {
    super.initState();
    _usernameCtrl.addListener(
      () => setState(() {
        _usernameChecked = false;
        _usernameAvailable = false;
      }),
    );
  }

  @override
  void dispose() {
    for (final c in [
      _nameCtrl,
      _usernameCtrl,
      _emailCtrl,
      _mobileCtrl,
      ..._emailOtpCtrls,
      ..._mobileOtpCtrls,
    ]) {
      c.dispose();
    }
    for (final f in [..._emailOtpNodes, ..._mobileOtpNodes]) {
      f.dispose();
    }
    super.dispose();
  }

  String _otp(List<TextEditingController> c) => c.map((e) => e.text).join();

  void _dispatch(RegisterEvent e) => context.read<RegisterBloc>().add(e);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: _onStateChange,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('New User Setup', style: AppTextStyles.h1(context)),
                const SizedBox(height: 32),
                NameFieldSection(
                  controller: _nameCtrl,
                  onGetSuggestions: () {
                    final n = _nameCtrl.text.trim();
                    if (n.isNotEmpty) _dispatch(UsernameSuggestionsFetched(n));
                  },
                ),
                const SizedBox(height: 24),
                UsernameSection(
                  controller: _usernameCtrl,
                  usernameChecked: _usernameChecked,
                  usernameAvailable: _usernameAvailable,
                  showSuggestions: _showSuggestions,
                  suggestions: _suggestions,
                  onCheckUsername: () {
                    final u = _usernameCtrl.text.trim();
                    if (u.isNotEmpty) _dispatch(UsernameChecked(u));
                  },
                  onSuggestionSelected: (s) {
                    _usernameCtrl.text = s;
                    setState(() => _showSuggestions = false);
                    _dispatch(UsernameChecked(s));
                  },
                ),
                const SizedBox(height: 24),
                OtpVerifySection(
                  label: 'E-mail ID',
                  hintText: 'Enter your email',
                  fieldController: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  isVerified: _emailVerified,
                  showOtp: _showEmailOtp,
                  otpLabel: 'Enter OTP sent to your email',
                  otpControllers: _emailOtpCtrls,
                  otpFocusNodes: _emailOtpNodes,
                  onVerifyTap: () {
                    _activeOtpType = 'email';
                    _dispatch(
                      SendOtpRequested(
                        username: _usernameCtrl.text.trim(),
                        email: _emailCtrl.text.trim(),
                      ),
                    );
                  },
                  onConfirmOtp: () {
                    _activeOtpType = 'email';
                    _dispatch(
                      VerifyOtpRequested(
                        username: _usernameCtrl.text.trim(),
                        otp: _otp(_emailOtpCtrls),
                        email: _emailCtrl.text.trim(),
                      ),
                    );
                  },
                  onResendOtp: () {
                    _activeOtpType = 'email';
                    _dispatch(
                      SendOtpRequested(
                        username: _usernameCtrl.text.trim(),
                        email: _emailCtrl.text.trim(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                OtpVerifySection(
                  label: 'Mobile',
                  hintText: '1234567890',
                  fieldController: _mobileCtrl,
                  keyboardType: TextInputType.phone,
                  isVerified: _mobileVerified,
                  showOtp: _showMobileOtp,
                  otpLabel: 'Enter OTP sent to your mobile',
                  otpControllers: _mobileOtpCtrls,
                  otpFocusNodes: _mobileOtpNodes,
                  onVerifyTap: () {
                    _activeOtpType = 'mobile';
                    _dispatch(
                      SendOtpRequested(
                        username: _usernameCtrl.text.trim(),
                        phone: _mobileCtrl.text.trim(),
                      ),
                    );
                  },
                  onConfirmOtp: () {
                    _activeOtpType = 'mobile';
                    _dispatch(
                      VerifyOtpRequested(
                        username: _usernameCtrl.text.trim(),
                        otp: _otp(_mobileOtpCtrls),
                        phone: _mobileCtrl.text.trim(),
                      ),
                    );
                  },
                  onResendOtp: () {
                    _activeOtpType = 'mobile';
                    _dispatch(
                      SendOtpRequested(
                        username: _usernameCtrl.text.trim(),
                        phone: _mobileCtrl.text.trim(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                const TermsAgreementWidget(),
                const SizedBox(height: 32),
                RegisterActionButtons(
                  onCancel: () => Navigator.pop(context),
                  onLogin: () {
                    final bloc = context.read<RegisterBloc>();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: bloc,
                          child: const AcademicDetailsPage(),
                        ),
                      ),
                    );
                  },
                  onSignIn: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onStateChange(BuildContext context, RegisterState state) {
    if (state is UsernameSuggestionsLoadSuccess) {
      setState(() {
        _suggestions = state.suggestions;
        _showSuggestions = state.suggestions.isNotEmpty;
      });
    }
    if (state is UsernameSuggestionsLoadFailure) {
      setState(() => _showSuggestions = false);
    }
    if (state is UsernameCheckLoadSuccess) {
      setState(() {
        _usernameChecked = true;
        _usernameAvailable = state.available;
      });
    }
    if (state is UsernameCheckLoadFailure) {
      setState(() {
        _usernameChecked = true;
        _usernameAvailable = false;
      });
    }
    if (state is SendOtpLoadSuccess) {
      if (_activeOtpType == 'email') {
        setState(() => _showEmailOtp = true);
      } else {
        setState(() => _showMobileOtp = true);
      }
      _snack(state.message);
    }
    if (state is SendOtpLoadFailure) _snack('Failed: ${state.error}');
    if (state is VerifyOtpLoadSuccess) {
      if (_activeOtpType == 'email') {
        setState(() => _emailVerified = true);
      } else {
        setState(() => _mobileVerified = true);
      }
      _snack(state.message);
    }
    if (state is VerifyOtpLoadFailure) _snack('Failed: ${state.error}');
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
