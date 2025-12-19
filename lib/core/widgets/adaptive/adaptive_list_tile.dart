import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import 'adaptive_icons.dart';

/// Platform-adaptive list tile.
class AdaptiveListTile extends StatelessWidget {
  const AdaptiveListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.showChevron = false,
    this.dense = false,
    this.enabled = true,
    this.contentPadding,
    this.backgroundColor,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showChevron;
  final bool dense;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final effectiveTrailing = trailing ??
        (showChevron
            ? Icon(
                AdaptiveIcons.chevronRight,
                color: Platform.isIOS
                    ? CupertinoColors.systemGrey
                    : Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              )
            : null);

    if (Platform.isIOS) {
      return _buildCupertinoListTile(context, effectiveTrailing);
    }

    return _buildMaterialListTile(context, effectiveTrailing);
  }

  Widget _buildCupertinoListTile(BuildContext context, Widget? effectiveTrailing) {
    final brightness = CupertinoTheme.brightnessOf(context);
    final isLight = brightness == Brightness.light;

    return GestureDetector(
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      child: Container(
        color: backgroundColor ??
            (isLight ? AppColors.surfaceLight : AppColors.surfaceDark),
        padding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: dense ? AppSpacing.sm : AppSpacing.md,
            ),
        child: Row(
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: AppSpacing.md),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultTextStyle(
                    style: AppTypography.bodyLarge.copyWith(
                      color: enabled
                          ? (isLight
                              ? AppColors.textPrimaryLight
                              : AppColors.textPrimaryDark)
                          : (isLight
                              ? AppColors.textTertiaryLight
                              : AppColors.textTertiaryDark),
                    ),
                    child: title,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSpacing.xxs),
                    DefaultTextStyle(
                      style: AppTypography.bodySmall.copyWith(
                        color: isLight
                            ? AppColors.textSecondaryLight
                            : AppColors.textSecondaryDark,
                      ),
                      child: subtitle!,
                    ),
                  ],
                ],
              ),
            ),
            if (effectiveTrailing != null) ...[
              const SizedBox(width: AppSpacing.sm),
              effectiveTrailing,
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialListTile(BuildContext context, Widget? effectiveTrailing) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: effectiveTrailing,
      onTap: onTap,
      onLongPress: onLongPress,
      dense: dense,
      enabled: enabled,
      contentPadding: contentPadding,
      tileColor: backgroundColor,
    );
  }
}

/// Platform-adaptive section header for grouped lists.
class AdaptiveListSection extends StatelessWidget {
  const AdaptiveListSection({
    super.key,
    this.header,
    this.footer,
    required this.children,
    this.dividerMargin,
  });

  final String? header;
  final String? footer;
  final List<Widget> children;
  final double? dividerMargin;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoListSection.insetGrouped(
        header: header != null ? Text(header!) : null,
        footer: footer != null ? Text(footer!) : null,
        dividerMargin: dividerMargin ?? 16,
        children: children,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (header != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            child: Text(
              header!.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    letterSpacing: 0.5,
                  ),
            ),
          ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  Divider(
                    height: 1,
                    indent: dividerMargin ?? AppSpacing.md,
                    endIndent: dividerMargin ?? 0,
                  ),
              ],
            ],
          ),
        ),
        if (footer != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.md,
            ),
            child: Text(
              footer!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
      ],
    );
  }
}
