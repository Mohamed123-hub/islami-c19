import 'package:flutter/material.dart';

class TabInfo {
  TabInfo({
    required this.iconPath,
    required this.backgroundImage,
    required this.content,
    required this.label,
  });

  final String iconPath;
  final String label;
  final String backgroundImage;
  final Widget content;
}
