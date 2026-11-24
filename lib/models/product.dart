import 'package:flutter/material.dart';

/// Data satu produk.
/// Informasi produk beserta gambar kategori yang ditampilkan pada kartu.
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final double rating; // 0 - 5
  final int reviews;
  final IconData icon;
  final Color color;
  final String imagePath;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.icon,
    required this.color,
    required this.imagePath,
  });
}
