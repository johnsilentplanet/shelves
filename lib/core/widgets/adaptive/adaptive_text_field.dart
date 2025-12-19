import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_theme.dart';

/// Platform-adaptive text field.
class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.placeholder,
    this.label,
    this.helper,
    this.error,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.autofillHints,
    this.style,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? placeholder;
  final String? label;
  final String? helper;
  final String? error;
  final Widget? prefix;
  final Widget? suffix;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool autocorrect;
  final bool autofocus;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final Iterable<String>? autofillHints;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _buildCupertinoTextField(context);
    }
    return _buildMaterialTextField(context);
  }

  Widget _buildCupertinoTextField(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    final isLight = brightness == Brightness.light;

    final field = CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      placeholder: placeholder,
      prefix: prefix ?? (prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Icon(prefixIcon, size: 20),
            )
          : null),
      suffix: suffix ?? (suffixIcon != null
          ? Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(suffixIcon, size: 20),
            )
          : null),
      obscureText: obscureText,
      autocorrect: autocorrect,
      autofocus: autofocus,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      autofillHints: autofillHints,
      style: style,
      padding: AppSpacing.paddingMd,
      decoration: BoxDecoration(
        color: isLight ? AppColors.surfaceLight : AppColors.surfaceDark,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(
          color: error != null
              ? AppColors.error
              : (isLight ? AppColors.dividerLight : AppColors.dividerDark),
        ),
      ),
    );

    if (label == null && error == null && helper == null) {
      return field;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTypography.labelMedium.copyWith(
              color: isLight
                  ? AppColors.textSecondaryLight
                  : AppColors.textSecondaryDark,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        field,
        if (error != null || helper != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            error ?? helper!,
            style: AppTypography.bodySmall.copyWith(
              color: error != null
                  ? AppColors.error
                  : (isLight
                      ? AppColors.textTertiaryLight
                      : AppColors.textTertiaryDark),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildMaterialTextField(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      autocorrect: autocorrect,
      autofocus: autofocus,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      autofillHints: autofillHints,
      style: style,
      decoration: InputDecoration(
        hintText: placeholder,
        labelText: label,
        helperText: helper,
        errorText: error,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : prefix,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : suffix,
      ),
    );
  }
}

/// Platform-adaptive search field.
class AdaptiveSearchField extends StatelessWidget {
  const AdaptiveSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.placeholder = 'Search',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoSearchTextField(
        controller: controller,
        focusNode: focusNode,
        placeholder: placeholder,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        onSuffixTap: onClear,
      );
    }

    return SearchBar(
      controller: controller,
      focusNode: focusNode,
      hintText: placeholder,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autoFocus: autofocus,
      leading: const Icon(Icons.search),
      trailing: controller != null
          ? [
              ListenableBuilder(
                listenable: controller!,
                builder: (context, _) {
                  if (controller!.text.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      controller!.clear();
                      onClear?.call();
                      onChanged?.call('');
                    },
                  );
                },
              ),
            ]
          : null,
    );
  }
}
