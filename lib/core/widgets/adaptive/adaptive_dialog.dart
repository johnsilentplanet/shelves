import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Shows a platform-adaptive alert dialog.
Future<T?> showAdaptiveAlertDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelText,
  String? confirmText,
  bool isDestructive = false,
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
}) {
  if (Platform.isIOS) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: content != null ? Text(content) : null,
        actions: [
          if (cancelText != null)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          if (confirmText != null)
            CupertinoDialogAction(
              isDestructiveAction: isDestructive,
              onPressed: () {
                Navigator.of(context).pop(true);
                onConfirm?.call();
              },
              child: Text(confirmText),
            ),
        ],
      ),
    );
  }

  return showDialog<T>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onCancel?.call();
            },
            child: Text(cancelText),
          ),
        if (confirmText != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              onConfirm?.call();
            },
            style: isDestructive
                ? TextButton.styleFrom(foregroundColor: AppColors.error)
                : null,
            child: Text(confirmText),
          ),
      ],
    ),
  );
}

/// Shows a platform-adaptive action sheet / bottom sheet.
Future<T?> showAdaptiveActionSheet<T>({
  required BuildContext context,
  String? title,
  String? message,
  required List<AdaptiveAction> actions,
  AdaptiveAction? cancelAction,
}) {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: title != null ? Text(title) : null,
        message: message != null ? Text(message) : null,
        actions: actions
            .map((action) => CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.of(context).pop(action.value);
                    action.onPressed?.call();
                  },
                  isDestructiveAction: action.isDestructive,
                  isDefaultAction: action.isDefault,
                  child: Text(action.label),
                ))
            .toList(),
        cancelButton: cancelAction != null
            ? CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.of(context).pop();
                  cancelAction.onPressed?.call();
                },
                child: Text(cancelAction.label),
              )
            : null,
      ),
    );
  }

  return showModalBottomSheet<T>(
    context: context,
    builder: (context) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null || message != null)
            Padding(
              padding: AppSpacing.paddingMd,
              child: Column(
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  if (message != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          const Divider(height: 1),
          ...actions.map((action) => ListTile(
                title: Text(
                  action.label,
                  style: TextStyle(
                    color: action.isDestructive
                        ? AppColors.error
                        : (action.isDefault
                            ? Theme.of(context).colorScheme.primary
                            : null),
                    fontWeight: action.isDefault ? FontWeight.w600 : null,
                  ),
                ),
                leading: action.icon != null ? Icon(action.icon) : null,
                onTap: () {
                  Navigator.of(context).pop(action.value);
                  action.onPressed?.call();
                },
              )),
          if (cancelAction != null) ...[
            const Divider(height: 1),
            ListTile(
              title: Text(
                cancelAction.label,
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pop();
                cancelAction.onPressed?.call();
              },
            ),
          ],
        ],
      ),
    ),
  );
}

/// Represents an action in an action sheet.
class AdaptiveAction<T> {
  const AdaptiveAction({
    required this.label,
    this.value,
    this.icon,
    this.onPressed,
    this.isDestructive = false,
    this.isDefault = false,
  });

  final String label;
  final T? value;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isDestructive;
  final bool isDefault;
}

/// Shows a platform-adaptive loading dialog.
void showAdaptiveLoadingDialog({
  required BuildContext context,
  String? message,
}) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: AppSpacing.paddingLg,
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor,
            borderRadius: AppSpacing.borderRadiusMd,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoActivityIndicator(),
              if (message != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(message),
              ],
            ],
          ),
        ),
      ),
    );
    return;
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Card(
        child: Padding(
          padding: AppSpacing.paddingLg,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              if (message != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(message),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}
