import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_icons.dart';

/// Represents a tab destination in the bottom tab bar.
class AdaptiveTabDestination {
  const AdaptiveTabDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.badge,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String? badge;
}

/// Platform-adaptive bottom tab bar scaffold.
/// Uses CupertinoTabScaffold on iOS and NavigationBar on Android.
class AdaptiveTabScaffold extends StatelessWidget {
  const AdaptiveTabScaffold({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.body,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<AdaptiveTabDestination> destinations;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _buildCupertinoTabScaffold(context);
    }
    return _buildMaterialTabScaffold(context);
  }

  Widget _buildCupertinoTabScaffold(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: onDestinationSelected,
        items: destinations
            .map((dest) => BottomNavigationBarItem(
                  icon: Icon(dest.icon),
                  activeIcon: Icon(dest.selectedIcon),
                  label: dest.label,
                ))
            .toList(),
      ),
      tabBuilder: (context, index) => body,
    );
  }

  Widget _buildMaterialTabScaffold(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations
            .map((dest) => NavigationDestination(
                  icon: dest.badge != null
                      ? Badge(
                          label: Text(dest.badge!),
                          child: Icon(dest.icon),
                        )
                      : Icon(dest.icon),
                  selectedIcon: dest.badge != null
                      ? Badge(
                          label: Text(dest.badge!),
                          child: Icon(dest.selectedIcon),
                        )
                      : Icon(dest.selectedIcon),
                  label: dest.label,
                ))
            .toList(),
      ),
    );
  }
}

/// Pre-configured tab destinations for the Shelves app.
abstract final class ShelvesTabDestinations {
  static List<AdaptiveTabDestination> get all => [
        library,
        scan,
        shelves,
        reading,
        settings,
      ];

  static AdaptiveTabDestination get library => AdaptiveTabDestination(
        label: 'Library',
        icon: AdaptiveIcons.library,
        selectedIcon: AdaptiveIcons.libraryFilled,
      );

  static AdaptiveTabDestination get scan => AdaptiveTabDestination(
        label: 'Scan',
        icon: AdaptiveIcons.scan,
        selectedIcon: AdaptiveIcons.scan,
      );

  static AdaptiveTabDestination get shelves => AdaptiveTabDestination(
        label: 'Shelves',
        icon: AdaptiveIcons.shelves,
        selectedIcon: AdaptiveIcons.shelvesFilled,
      );

  static AdaptiveTabDestination get reading => AdaptiveTabDestination(
        label: 'Reading',
        icon: AdaptiveIcons.reading,
        selectedIcon: AdaptiveIcons.readingFilled,
      );

  static AdaptiveTabDestination get settings => AdaptiveTabDestination(
        label: 'Settings',
        icon: AdaptiveIcons.settings,
        selectedIcon: AdaptiveIcons.settingsFilled,
      );
}

/// Platform-adaptive segmented control / toggle.
class AdaptiveSegmentedControl<T extends Object> extends StatelessWidget {
  const AdaptiveSegmentedControl({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    this.style,
  });

  final Map<T, Widget> segments;
  final T selected;
  final ValueChanged<T> onSelectionChanged;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoSlidingSegmentedControl<T>(
        groupValue: selected,
        onValueChanged: (value) {
          if (value != null) {
            onSelectionChanged(value);
          }
        },
        children: segments,
      );
    }

    return SegmentedButton<T>(
      segments: segments.entries
          .map((entry) => ButtonSegment<T>(
                value: entry.key,
                label: entry.value,
              ))
          .toList(),
      selected: {selected},
      onSelectionChanged: (selection) {
        if (selection.isNotEmpty) {
          onSelectionChanged(selection.first);
        }
      },
      style: style,
    );
  }
}
