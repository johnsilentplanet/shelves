import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/auth_provider.dart';

/// Forgot password screen for password reset requests.
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetEmail() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(authProvider.notifier);
    final success = await notifier.sendPasswordResetEmail(
      _emailController.text.trim(),
    );

    if (success && mounted) {
      setState(() {
        _emailSent = true;
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isIOS = Platform.isIOS;
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: _buildBackButton(isIOS),
                ),
                const SizedBox(height: 48),

                // Icon
                _buildIcon(isDark),
                const SizedBox(height: 32),

                // Header
                _buildHeader(theme, isDark),
                const SizedBox(height: 32),

                if (_emailSent)
                  _buildSuccessMessage(isDark)
                else ...[
                  // Email field
                  _buildEmailField(isIOS, isDark),
                  const SizedBox(height: 24),

                  // Error message
                  if (authState.error != null) ...[
                    _buildErrorMessage(authState.error!, isDark),
                    const SizedBox(height: 16),
                  ],

                  // Send button
                  _buildSendButton(isIOS, authState.isLoading),
                ],

                const SizedBox(height: 32),

                // Back to login link
                _buildBackToLoginLink(isIOS, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(bool isIOS) {
    if (isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.pop(),
        child: Icon(
          CupertinoIcons.back,
          color: AppColors.primary,
        ),
      );
    }
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.pop(),
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildIcon(bool isDark) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          _emailSent ? CupertinoIcons.checkmark_circle : CupertinoIcons.lock,
          size: 40,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, bool isDark) {
    return Column(
      children: [
        Text(
          _emailSent ? 'Check Your Email' : 'Forgot Password?',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color:
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          _emailSent
              ? "We've sent a password reset link to your email address."
              : "No worries! Enter your email and we'll send you a reset link.",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailField(bool isIOS, bool isDark) {
    if (isIOS) {
      return CupertinoTextFormFieldRow(
        controller: _emailController,
        placeholder: 'Email',
        keyboardType: TextInputType.emailAddress,
        autocorrect: false,
        textInputAction: TextInputAction.done,
        validator: _validateEmail,
        onFieldSubmitted: (_) => _sendResetEmail(),
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(12),
        ),
        prefix: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Icon(
            CupertinoIcons.mail,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      );
    }

    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      validator: _validateEmail,
      onFieldSubmitted: (_) => _sendResetEmail(),
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email_outlined),
        filled: true,
        fillColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String error, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.exclamationmark_circle,
            color: AppColors.error,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              error,
              style: TextStyle(
                color: AppColors.error,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessMessage(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Icon(
            CupertinoIcons.mail,
            color: AppColors.success,
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            _emailController.text.trim(),
            style: TextStyle(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "If an account exists with this email, you'll receive a password reset link shortly.",
            style: TextStyle(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSendButton(bool isIOS, bool isLoading) {
    if (isIOS) {
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          onPressed: isLoading ? null : _sendResetEmail,
          child: isLoading
              ? const CupertinoActivityIndicator(color: Colors.white)
              : const Text('Send Reset Link'),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isLoading ? null : _sendResetEmail,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Text('Send Reset Link'),
      ),
    );
  }

  Widget _buildBackToLoginLink(bool isIOS, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remember your password? ',
          style: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        if (isIOS)
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => context.pop(),
            child: const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        else
          TextButton(
            onPressed: () => context.pop(),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
