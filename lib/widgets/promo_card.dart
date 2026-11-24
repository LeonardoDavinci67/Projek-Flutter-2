import 'package:flutter/material.dart';

import '../models/promo.dart';

/// Kartu promo dengan judul tebal dan gambar kategori.
/// [small] = true untuk versi kecil di baris horizontal.
class PromoCard extends StatelessWidget {
  final Promo promo;
  final bool small;
  final VoidCallback onTap;

  const PromoCard({
    super.key,
    required this.promo,
    required this.onTap,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: small ? 0 : 6),
        padding: EdgeInsets.all(small ? 14 : 20),
        decoration: BoxDecoration(
          color: promo.color,
          borderRadius: BorderRadius.circular(small ? 20 : 26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              promo.title,
              style: TextStyle(
                fontSize: small ? 18 : 30,
                fontWeight: FontWeight.w900,
                height: 1.1,
                color: promo.textColor,
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(promo.imagePath, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
