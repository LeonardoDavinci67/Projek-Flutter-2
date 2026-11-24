import 'package:flutter/material.dart';

/// Satu kotak kategori, misalnya "Clothing" atau "Headphones".
class CategoryItem {
  final String label;
  final IconData icon;
  final Color color;
  final Color accent;
  final String imagePath;

  const CategoryItem({
    required this.label,
    required this.icon,
    required this.color,
    required this.accent,
    required this.imagePath,
  });
}

/// Satu bagian di Home, misalnya "Gear up to get fit" beserta 4 kotaknya.
class CategorySectionData {
  final String title;
  final List<CategoryItem> items;

  const CategorySectionData({required this.title, required this.items});
}
