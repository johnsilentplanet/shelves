import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Platform-adaptive icon mapping.
/// Provides consistent iconography that uses the appropriate icon set per platform.
abstract final class AdaptiveIcons {
  // Navigation
  static IconData get home =>
      Platform.isIOS ? CupertinoIcons.home : Icons.home_outlined;
  static IconData get homeFilled =>
      Platform.isIOS ? CupertinoIcons.house_fill : Icons.home;

  static IconData get library =>
      Platform.isIOS ? CupertinoIcons.collections : Icons.collections_bookmark_outlined;
  static IconData get libraryFilled =>
      Platform.isIOS ? CupertinoIcons.collections_solid : Icons.collections_bookmark;

  static IconData get scan => Platform.isIOS
      ? CupertinoIcons.barcode_viewfinder
      : Icons.qr_code_scanner;

  static IconData get shelves =>
      Platform.isIOS ? CupertinoIcons.square_grid_2x2 : Icons.shelves;
  static IconData get shelvesFilled =>
      Platform.isIOS ? CupertinoIcons.square_grid_2x2_fill : Icons.shelves;

  static IconData get reading =>
      Platform.isIOS ? CupertinoIcons.book : Icons.auto_stories_outlined;
  static IconData get readingFilled =>
      Platform.isIOS ? CupertinoIcons.book_fill : Icons.auto_stories;

  static IconData get settings =>
      Platform.isIOS ? CupertinoIcons.gear : Icons.settings_outlined;
  static IconData get settingsFilled =>
      Platform.isIOS ? CupertinoIcons.gear_solid : Icons.settings;

  // Actions
  static IconData get add =>
      Platform.isIOS ? CupertinoIcons.add : Icons.add;
  static IconData get addCircle =>
      Platform.isIOS ? CupertinoIcons.add_circled : Icons.add_circle_outline;
  static IconData get addCircleFilled =>
      Platform.isIOS ? CupertinoIcons.add_circled_solid : Icons.add_circle;

  static IconData get edit =>
      Platform.isIOS ? CupertinoIcons.pencil : Icons.edit_outlined;
  static IconData get delete =>
      Platform.isIOS ? CupertinoIcons.trash : Icons.delete_outline;
  static IconData get deleteFilled =>
      Platform.isIOS ? CupertinoIcons.trash_fill : Icons.delete;

  static IconData get search =>
      Platform.isIOS ? CupertinoIcons.search : Icons.search;
  static IconData get filter =>
      Platform.isIOS ? CupertinoIcons.line_horizontal_3_decrease : Icons.filter_list;
  static IconData get sort =>
      Platform.isIOS ? CupertinoIcons.sort_down : Icons.sort;

  static IconData get share =>
      Platform.isIOS ? CupertinoIcons.share : Icons.share_outlined;
  static IconData get shareFilled =>
      Platform.isIOS ? CupertinoIcons.share_solid : Icons.share;

  static IconData get close =>
      Platform.isIOS ? CupertinoIcons.xmark : Icons.close;
  static IconData get check =>
      Platform.isIOS ? CupertinoIcons.checkmark : Icons.check;
  static IconData get checkCircle =>
      Platform.isIOS ? CupertinoIcons.checkmark_circle : Icons.check_circle_outline;
  static IconData get checkCircleFilled =>
      Platform.isIOS ? CupertinoIcons.checkmark_circle_fill : Icons.check_circle;

  static IconData get back =>
      Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back;
  static IconData get forward =>
      Platform.isIOS ? CupertinoIcons.forward : Icons.arrow_forward;
  static IconData get chevronRight =>
      Platform.isIOS ? CupertinoIcons.chevron_right : Icons.chevron_right;
  static IconData get chevronDown =>
      Platform.isIOS ? CupertinoIcons.chevron_down : Icons.keyboard_arrow_down;

  static IconData get more =>
      Platform.isIOS ? CupertinoIcons.ellipsis : Icons.more_vert;
  static IconData get moreHorizontal =>
      Platform.isIOS ? CupertinoIcons.ellipsis : Icons.more_horiz;

  // Book-related
  static IconData get book =>
      Platform.isIOS ? CupertinoIcons.book : Icons.menu_book;
  static IconData get bookFilled =>
      Platform.isIOS ? CupertinoIcons.book_fill : Icons.menu_book;

  static IconData get barcode =>
      Platform.isIOS ? CupertinoIcons.barcode : Icons.qr_code;

  static IconData get camera =>
      Platform.isIOS ? CupertinoIcons.camera : Icons.camera_alt_outlined;
  static IconData get cameraFilled =>
      Platform.isIOS ? CupertinoIcons.camera_fill : Icons.camera_alt;

  static IconData get flashlight =>
      Platform.isIOS ? CupertinoIcons.bolt : Icons.flash_on;
  static IconData get flashlightOff =>
      Platform.isIOS ? CupertinoIcons.bolt_slash : Icons.flash_off;

  static IconData get tag =>
      Platform.isIOS ? CupertinoIcons.tag : Icons.label_outline;
  static IconData get tagFilled =>
      Platform.isIOS ? CupertinoIcons.tag_fill : Icons.label;

  static IconData get star =>
      Platform.isIOS ? CupertinoIcons.star : Icons.star_outline;
  static IconData get starFilled =>
      Platform.isIOS ? CupertinoIcons.star_fill : Icons.star;
  static IconData get starHalf =>
      Platform.isIOS ? CupertinoIcons.star_lefthalf_fill : Icons.star_half;

  static IconData get person =>
      Platform.isIOS ? CupertinoIcons.person : Icons.person_outline;
  static IconData get personFilled =>
      Platform.isIOS ? CupertinoIcons.person_fill : Icons.person;

  // Status
  static IconData get info =>
      Platform.isIOS ? CupertinoIcons.info : Icons.info_outline;
  static IconData get infoFilled =>
      Platform.isIOS ? CupertinoIcons.info_circle_fill : Icons.info;

  static IconData get warning =>
      Platform.isIOS ? CupertinoIcons.exclamationmark_triangle : Icons.warning_amber_outlined;
  static IconData get warningFilled =>
      Platform.isIOS ? CupertinoIcons.exclamationmark_triangle_fill : Icons.warning_amber;

  static IconData get error =>
      Platform.isIOS ? CupertinoIcons.xmark_circle : Icons.error_outline;
  static IconData get errorFilled =>
      Platform.isIOS ? CupertinoIcons.xmark_circle_fill : Icons.error;

  static IconData get success =>
      Platform.isIOS ? CupertinoIcons.checkmark_circle : Icons.check_circle_outline;
  static IconData get successFilled =>
      Platform.isIOS ? CupertinoIcons.checkmark_circle_fill : Icons.check_circle;

  // Settings
  static IconData get darkMode =>
      Platform.isIOS ? CupertinoIcons.moon : Icons.dark_mode_outlined;
  static IconData get darkModeFilled =>
      Platform.isIOS ? CupertinoIcons.moon_fill : Icons.dark_mode;

  static IconData get lightMode =>
      Platform.isIOS ? CupertinoIcons.sun_max : Icons.light_mode_outlined;
  static IconData get lightModeFilled =>
      Platform.isIOS ? CupertinoIcons.sun_max_fill : Icons.light_mode;

  static IconData get privacy =>
      Platform.isIOS ? CupertinoIcons.shield : Icons.security;
  static IconData get privacyFilled =>
      Platform.isIOS ? CupertinoIcons.shield_fill : Icons.security;

  static IconData get logout =>
      Platform.isIOS ? CupertinoIcons.square_arrow_right : Icons.logout;

  static IconData get sync =>
      Platform.isIOS ? CupertinoIcons.arrow_2_circlepath : Icons.sync;

  static IconData get cloud =>
      Platform.isIOS ? CupertinoIcons.cloud : Icons.cloud_outlined;
  static IconData get cloudFilled =>
      Platform.isIOS ? CupertinoIcons.cloud_fill : Icons.cloud;
  static IconData get cloudUpload =>
      Platform.isIOS ? CupertinoIcons.cloud_upload : Icons.cloud_upload_outlined;
  static IconData get cloudDownload =>
      Platform.isIOS ? CupertinoIcons.cloud_download : Icons.cloud_download_outlined;

  static IconData get premium =>
      Platform.isIOS ? CupertinoIcons.sparkles : Icons.auto_awesome;

  // Import/Export
  static IconData get import =>
      Platform.isIOS ? CupertinoIcons.square_arrow_down : Icons.file_download_outlined;
  static IconData get export =>
      Platform.isIOS ? CupertinoIcons.square_arrow_up : Icons.file_upload_outlined;

  // Miscellaneous
  static IconData get refresh =>
      Platform.isIOS ? CupertinoIcons.refresh : Icons.refresh;

  static IconData get copy =>
      Platform.isIOS ? CupertinoIcons.doc_on_doc : Icons.copy;

  static IconData get link =>
      Platform.isIOS ? CupertinoIcons.link : Icons.link;

  static IconData get externalLink =>
      Platform.isIOS ? CupertinoIcons.arrow_up_right_square : Icons.open_in_new;

  static IconData get room =>
      Platform.isIOS ? CupertinoIcons.house : Icons.meeting_room_outlined;
  static IconData get roomFilled =>
      Platform.isIOS ? CupertinoIcons.house_fill : Icons.meeting_room;
}
