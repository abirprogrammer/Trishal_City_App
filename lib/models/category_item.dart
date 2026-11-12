import 'package:flutter/material.dart';

class CategoryItem {
  final String id;
  final String titleEn;
  final String titleBn;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String countText;

  const CategoryItem({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.countText,
  });
}
