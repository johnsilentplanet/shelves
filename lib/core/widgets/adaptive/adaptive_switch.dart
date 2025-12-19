import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Platform-adaptive switch/toggle.
class AdaptiveSwitch extends StatelessWidget {
  const AdaptiveSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
      );
    }

    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }
}

/// Platform-adaptive switch list tile.
class AdaptiveSwitchListTile extends StatelessWidget {
  const AdaptiveSwitchListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
    this.secondary,
    this.activeColor,
    this.dense = false,
    this.contentPadding,
  });

  final Widget title;
  final Widget? subtitle;
  final Widget? secondary;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final bool dense;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    // Both platforms use the same list tile structure,
    // but with platform-specific switch
    return ListTile(
      title: title,
      subtitle: subtitle,
      leading: secondary,
      trailing: AdaptiveSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
      ),
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      dense: dense,
      contentPadding: contentPadding,
    );
  }
}
