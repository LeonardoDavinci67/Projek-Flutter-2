import 'package:flutter/material.dart';

/// Kartu promo di halaman Home (kartu besar dan kartu kecil).
class Promo {
  final String title;
  final Color color; // warna latar kartu
  final Color accent; // warna ikon
  final Color textColor;
  final IconData icon;
  final String imagePath;
  final String? category; // kategori produk yang dibuka saat kartu diketuk

  const Promo({
    required this.title,
    required this.color,
    required this.accent,
    required this.icon,
    required this.imagePath,
    this.textColor = Colors.black,
    this.category,
  });
}
