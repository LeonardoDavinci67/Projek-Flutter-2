import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Menampilkan bintang rating + jumlah ulasan, contoh: ★★★★☆ 92,213
class RatingStars extends StatelessWidget {
  final double rating;
  final int reviews;

  const RatingStars({super.key, required this.rating, required this.reviews});

  // Mengubah 92213 menjadi "92,213"
  String _formatNumber(int n) {
    return n.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => ',',
        );
  }

  @override
  Widget build(BuildContext context) {
    final stars = <Widget>[];
    for (int i = 0; i < 5; i++) {
      IconData icon;
      if (rating >= i + 1) {
        icon = Icons.star;
      } else if (rating >= i + 0.5) {
        icon = Icons.star_half;
      } else {
        icon = Icons.star_border;
      }
      stars.add(Icon(icon, size: 15, color: AppColors.star));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...stars,
        const SizedBox(width: 4),
        Text(
          _formatNumber(reviews),
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
