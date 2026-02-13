import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';
import 'package:moksha_path/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:moksha_path/features/auth/presentation/pages/dashboard.dart';
import 'package:moksha_path/features/auth/presentation/widgets/tab_toggle.dart';
import 'package:moksha_path/features/register/presentation/pages/register_root_page.dart';
import 'package:moksha_path/features/register/presentation/widgets/otp_verify_section.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isEmailSelected = true;
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController();

  // OTP controllers & nodes
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(6, (_) => FocusNode());

  bool _otpSent = false;
  bool _otpVerified = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _emailCtrl.dispose();
    _mobileCtrl.dispose();
    for (final c in _otpControllers) {
      c.dispose();
    }
    for (final n in _otpFocusNodes) {
      n.dispose();
    }
    super.dispose();
  }

  String get _otp => _otpControllers.map((c) => c.text).join();

  void _clearOtp() {
    for (final c in _otpControllers) {
      c.clear();
    }
    setState(() {
      _otpSent = false;
      _otpVerified = false;
    });
  }

  void _sendOtp() {
    final username = _usernameCtrl.text.trim();
    if (username.isEmpty) {
      _snack('Please enter username first');
      return;
    }

    if (isEmailSelected) {
      final email = _emailCtrl.text.trim();
      if (email.isEmpty) {
        _snack('Please enter email');
        return;
      }
      context.read<AuthBloc>().add(
        LoginOtpSendRequested(username: username, email: email),
      );
    } else {
      final mobile = _mobileCtrl.text.trim();
      if (mobile.isEmpty) {
        _snack('Please enter mobile');
        return;
      }
      context.read<AuthBloc>().add(
        LoginOtpSendRequested(username: username, phone: mobile),
      );
    }
  }

  void _verifyOtp() {
    if (_otp.length < 6) {
      _snack('Please enter full 6-digit OTP');
      return;
    }
    final username = _usernameCtrl.text.trim();

    if (isEmailSelected) {
      context.read<AuthBloc>().add(
        LoginOtpVerifyRequested(
          username: username,
          otp: _otp,
          email: _emailCtrl.text.trim(),
        ),
      );
    } else {
      context.read<AuthBloc>().add(
        LoginOtpVerifyRequested(
          username: username,
          otp: _otp,
          phone: _mobileCtrl.text.trim(),
        ),
      );
    }
  }

  void _signIn() {
    if (!_otpVerified) {
      _snack('Please verify OTP first');
      return;
    }
    final username = _usernameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final mobile = _mobileCtrl.text.trim();

    context.read<AuthBloc>().add(
      LoginRegistrationRequested(
        roleId: 1,
        username: username,
        fullName: username,
        email: email.isNotEmpty ? email : '',
        mobile: mobile.isNotEmpty ? mobile : '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      body: BlocListener<AuthBloc, AuthState>(
        listener: _onStateChange,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Sign In to Your Account',
                  style: AppTextStyles.h1(context),
                ),
                const SizedBox(height: 32),

                // Username Field
                LabeledTextField(
                  label: 'Username',
                  hintText: 'Enter your username',
                  controller: _usernameCtrl,
                ),
                const SizedBox(height: 8),

                // Forgot Credential Link
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => debugPrint('Forgot Credential tapped'),
                    child: Text(
                      'Forgot Credential?',
                      style: AppTextStyles.body(
                        context,
                      ).copyWith(color: AppTheme.of(context).primary),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Email/Mobile Tab Toggle
                TabToggle(
                  isEmailSelected: isEmailSelected,
                  onChanged: (val) {
                    setState(() {
                      isEmailSelected = val;
                      _clearOtp();
                    });
                  },
                ),
                const SizedBox(height: 16),

                // OTP Verify Section — reusing register widget
                if (isEmailSelected)
                  OtpVerifySection(
                    label: 'E-mail ID',
                    hintText: 'Enter your email',
                    fieldController: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    isVerified: _otpVerified,
                    showOtp: _otpSent,
                    otpLabel: 'Enter OTP sent to your email',
                    otpControllers: _otpControllers,
                    otpFocusNodes: _otpFocusNodes,
                    onVerifyTap: _sendOtp,
                    onConfirmOtp: _verifyOtp,
                    onResendOtp: _sendOtp,
                  )
                else
                  OtpVerifySection(
                    label: 'Mobile',
                    hintText: 'Enter your mobile number',
                    fieldController: _mobileCtrl,
                    keyboardType: TextInputType.phone,
                    isVerified: _otpVerified,
                    showOtp: _otpSent,
                    otpLabel: 'Enter OTP sent to your mobile',
                    otpControllers: _otpControllers,
                    otpFocusNodes: _otpFocusNodes,
                    onVerifyTap: _sendOtp,
                    onConfirmOtp: _verifyOtp,
                    onResendOtp: _sendOtp,
                  ),
                const SizedBox(height: 32),

                // Action Buttons
                Row(
                  children: [
                    GlobalChip(
                      text: 'Back',
                      isActive: false,
                      onTap: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 12),
                    GlobalChip(
                      text: 'Cancel',
                      isActive: false,
                      onTap: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 12),
                    _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : GlobalChip(
                            text: 'Sign In',
                            isActive: _otpVerified,
                            onTap: _signIn,
                          ),
                  ],
                ),
                const SizedBox(height: 24),

                // Create Account Link
                Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppTextStyles.body(context),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterRootPage(),
                        ),
                      ),
                      child: Text(
                        'Create an account',
                        style: AppTextStyles.body(context).copyWith(
                          color: AppTheme.of(context).primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  void _onStateChange(BuildContext context, AuthState state) {
    // OTP Send
    if (state is LoginOtpSendInProgress) {
      setState(() => _isLoading = true);
    }
    if (state is LoginOtpSendSuccess) {
      setState(() {
        _otpSent = true;
        _isLoading = false;
      });
      _snack('OTP sent successfully');
    }
    if (state is LoginOtpSendFailure) {
      setState(() => _isLoading = false);
      _snack('Failed to send OTP: ${state.error}');
    }

    // OTP Verify
    if (state is LoginOtpVerifyInProgress) {
      setState(() => _isLoading = true);
    }
    if (state is LoginOtpVerifySuccess) {
      setState(() {
        _otpVerified = true;
        _isLoading = false;
      });
      _snack('OTP verified ✓');
    }
    if (state is LoginOtpVerifyFailure) {
      setState(() => _isLoading = false);
      _snack('OTP verification failed: ${state.error}');
    }

    // Registration
    if (state is LoginRegistrationInProgress) {
      setState(() => _isLoading = true);
    }
    if (state is LoginRegistrationSuccess) {
      setState(() => _isLoading = false);
      _snack('Login successful! Welcome ${state.user.name}');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const Dashboard()),
        (route) => false,
      );
    }
    if (state is LoginRegistrationFailure) {
      setState(() => _isLoading = false);
      _snack('Registration failed: ${state.error}');
    }
  }

  void _snack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
