import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Platform-adaptive page scaffold.
class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    this.appBar,
    this.navigationBar,
    required this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  });

  /// The app bar to display. Use [AdaptiveAppBar] for cross-platform support.
  final PreferredSizeWidget? appBar;

  /// The Cupertino navigation bar (only used on iOS).
  final ObstructingPreferredSizeWidget? navigationBar;

  /// The primary content of the scaffold.
  final Widget body;

  /// Floating action button (Material only, ignored on iOS).
  final Widget? floatingActionButton;

  /// FAB location (Material only).
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Bottom navigation bar.
  final Widget? bottomNavigationBar;

  /// Background color.
  final Color? backgroundColor;

  /// Whether to resize body when keyboard appears.
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: navigationBar,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        child: bottomNavigationBar != null
            ? Column(
                children: [
                  Expanded(child: body),
                  bottomNavigationBar!,
                ],
              )
            : body,
      );
    }

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}

/// Platform-adaptive app bar / navigation bar.
class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  const AdaptiveAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.centerTitle,
    this.elevation,
    this.bottom,
    this.largeTitle = false,
  });

  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final bool? centerTitle;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final bool largeTitle;

  @override
  Size get preferredSize => Size.fromHeight(
        largeTitle ? 96.0 : (kToolbarHeight + (bottom?.preferredSize.height ?? 0)),
      );

  @override
  bool shouldFullyObstruct(BuildContext context) => true;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _buildCupertinoNavigationBar(context);
    }
    return _buildMaterialAppBar(context);
  }

  Widget _buildCupertinoNavigationBar(BuildContext context) {
    if (largeTitle) {
      return CupertinoSliverNavigationBar(
        largeTitle: titleWidget ?? (title != null ? Text(title!) : null),
        leading: leading,
        trailing: actions != null && actions!.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: actions!,
              )
            : null,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor,
      );
    }

    return CupertinoNavigationBar(
      middle: titleWidget ?? (title != null ? Text(title!) : null),
      leading: leading,
      trailing: actions != null && actions!.isNotEmpty
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
    );
  }

  PreferredSizeWidget _buildMaterialAppBar(BuildContext context) {
    return AppBar(
      title: titleWidget ?? (title != null ? Text(title!) : null),
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      elevation: elevation,
      bottom: bottom,
    );
  }
}

/// A wrapper that provides a sliver-based scaffold for large title navigation.
class AdaptiveSliverScaffold extends StatelessWidget {
  const AdaptiveSliverScaffold({
    super.key,
    required this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    required this.slivers,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final List<Widget> slivers;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: titleWidget ?? Text(title),
              leading: leading,
              trailing: actions != null && actions!.isNotEmpty
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions!,
                    )
                  : null,
              backgroundColor: backgroundColor,
            ),
            ...slivers,
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: titleWidget ?? Text(title),
            leading: leading,
            actions: actions,
            backgroundColor: backgroundColor,
          ),
          ...slivers,
        ],
      ),
    );
  }
}

/// Platform-adaptive refresh indicator.
class AdaptiveRefreshIndicator extends StatelessWidget {
  const AdaptiveRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      // For iOS, use CustomScrollView with CupertinoSliverRefreshControl
      // or wrap the child appropriately
      return CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          SliverToBoxAdapter(child: child),
        ],
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}
