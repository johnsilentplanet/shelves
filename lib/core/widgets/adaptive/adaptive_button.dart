import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Platform-adaptive filled/primary button.
class AdaptiveFilledButton extends StatelessWidget {
  const AdaptiveFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isDestructive = false,
    this.isLoading = false,
    this.padding,
    this.minSize,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isDestructive;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final Size? minSize;

  @override
  Widget build(BuildContext context) {
    final effectiveChild = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: Platform.isIOS
                ? const CupertinoActivityIndicator(color: Colors.white)
                : const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
          )
        : child;

    if (Platform.isIOS) {
      return CupertinoButton.filled(
        onPressed: isLoading ? null : onPressed,
        padding: padding ?? AppSpacing.paddingMd,
        minSize: minSize?.height ?? AppSpacing.minTouchTarget,
        child: effectiveChild,
      );
    }

    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: isDestructive ? AppColors.error : null,
        padding: padding,
        minimumSize: minSize,
      ),
      child: effectiveChild,
    );
  }
}

/// Platform-adaptive outlined/secondary button.
class AdaptiveOutlinedButton extends StatelessWidget {
  const AdaptiveOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isDestructive = false,
    this.isLoading = false,
    this.padding,
    this.minSize,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isDestructive;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final Size? minSize;

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDestructive
        ? AppColors.error
        : Theme.of(context).colorScheme.primary;

    final effectiveChild = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: Platform.isIOS
                ? CupertinoActivityIndicator(color: primaryColor)
                : CircularProgressIndicator(
                    strokeWidth: 2,
                    color: primaryColor,
                  ),
          )
        : child;

    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: isLoading ? null : onPressed,
        padding: padding ?? AppSpacing.paddingMd,
        minSize: minSize?.height ?? AppSpacing.minTouchTarget,
        child: DefaultTextStyle(
          style: TextStyle(color: primaryColor),
          child: effectiveChild,
        ),
      );
    }

    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor),
        padding: padding,
        minimumSize: minSize,
      ),
      child: effectiveChild,
    );
  }
}

/// Platform-adaptive text button.
class AdaptiveTextButton extends StatelessWidget {
  const AdaptiveTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isDestructive = false,
    this.padding,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isDestructive;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? AppColors.error
        : Theme.of(context).colorScheme.primary;

    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding ?? EdgeInsets.zero,
        minSize: AppSpacing.minTouchTarget,
        child: DefaultTextStyle(
          style: TextStyle(color: color),
          child: child,
        ),
      );
    }

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: padding,
      ),
      child: child,
    );
  }
}

/// Platform-adaptive icon button.
class AdaptiveIconButton extends StatelessWidget {
  const AdaptiveIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.size = 24.0,
    this.color,
    this.padding,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding ?? EdgeInsets.zero,
        minSize: AppSpacing.minTouchTarget,
        child: Icon(
          icon,
          size: size,
          color: color ?? CupertinoTheme.of(context).primaryColor,
        ),
      );
    }

    final button = IconButton(
      icon: Icon(icon, size: size),
      onPressed: onPressed,
      color: color,
      padding: padding ?? const EdgeInsets.all(8),
      constraints: const BoxConstraints(
        minWidth: AppSpacing.minTouchTarget,
        minHeight: AppSpacing.minTouchTarget,
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }
}
