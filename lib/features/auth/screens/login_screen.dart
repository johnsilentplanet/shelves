import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/auth_provider.dart';
import '../widgets/social_sign_in_buttons.dart';

/// Login screen with email/password and social sign-in options.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(authProvider.notifier);
    final success = await notifier.signInWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (success && mounted) {
      context.go('/');
    }
  }

  Future<void> _signInWithGoogle() async {
    final notifier = ref.read(authProvider.notifier);
    final success = await notifier.signInWithGoogle();

    if (success && mounted) {
      context.go('/');
    }
  }

  Future<void> _signInWithApple() async {
    final notifier = ref.read(authProvider.notifier);
    final success = await notifier.signInWithApple();

    if (success && mounted) {
      context.go('/');
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
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
                const SizedBox(height: 48),

                // Logo and title
                _buildHeader(theme, isDark),
                const SizedBox(height: 48),

                // Email field
                _buildEmailField(isIOS, isDark),
                const SizedBox(height: 16),

                // Password field
                _buildPasswordField(isIOS, isDark),
                const SizedBox(height: 8),

                // Forgot password link
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildForgotPasswordButton(isIOS, isDark),
                ),
                const SizedBox(height: 24),

                // Error message
                if (authState.error != null) ...[
                  _buildErrorMessage(authState.error!, isDark),
                  const SizedBox(height: 16),
                ],

                // Sign in button
                _buildSignInButton(isIOS, authState.isLoading),
                const SizedBox(height: 32),

                // Divider
                _buildDivider(isDark),
                const SizedBox(height: 32),

                // Social sign-in buttons
                SocialSignInButtons(
                  onGooglePressed: _signInWithGoogle,
                  onApplePressed: _signInWithApple,
                  isLoading: authState.isLoading,
                ),
                const SizedBox(height: 32),

                // Sign up link
                _buildSignUpLink(isIOS, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, bool isDark) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            CupertinoIcons.book_fill,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome Back',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color:
                isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to access your library',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
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
        textInputAction: TextInputAction.next,
        validator: _validateEmail,
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
      textInputAction: TextInputAction.next,
      validator: _validateEmail,
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

  Widget _buildPasswordField(bool isIOS, bool isDark) {
    if (isIOS) {
      return Stack(
        alignment: Alignment.centerRight,
        children: [
          CupertinoTextFormFieldRow(
            controller: _passwordController,
            placeholder: 'Password',
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            validator: _validatePassword,
            onFieldSubmitted: (_) => _signIn(),
            padding: const EdgeInsets.only(right: 48),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(12),
            ),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(
                CupertinoIcons.lock,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: CupertinoButton(
              padding: const EdgeInsets.only(right: 8),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: Icon(
                _obscurePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),
        ],
      );
    }

    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      textInputAction: TextInputAction.done,
      validator: _validatePassword,
      onFieldSubmitted: (_) => _signIn(),
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        filled: true,
        fillColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton(bool isIOS, bool isDark) {
    if (isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.push('/forgot-password'),
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
      );
    }

    return TextButton(
      onPressed: () => context.push('/forgot-password'),
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 14,
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

  Widget _buildSignInButton(bool isIOS, bool isLoading) {
    if (isIOS) {
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton.filled(
          onPressed: isLoading ? null : _signIn,
          child: isLoading
              ? const CupertinoActivityIndicator(color: Colors.white)
              : const Text('Sign In'),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isLoading ? null : _signIn,
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
            : const Text('Sign In'),
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDark ? AppColors.dividerDark : AppColors.dividerLight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or continue with',
            style: TextStyle(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: isDark ? AppColors.dividerDark : AppColors.dividerLight,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpLink(bool isIOS, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        if (isIOS)
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => context.push('/signup'),
            child: const Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        else
          TextButton(
            onPressed: () => context.push('/signup'),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
