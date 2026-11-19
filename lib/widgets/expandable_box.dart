import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kotak berbingkai yang bisa dibuka/tutup (dipakai di halaman Menu).
/// Status buka/tutup dikendalikan oleh parent lewat [isExpanded] dan [onTap].
/// Jika [children] kosong, kotak dianggap sebagai tombol biasa (panah ke kanan).
class ExpandableBox extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final List<Widget> children;

  const ExpandableBox({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final bool isButton = children.isEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border, width: 1.2),
      ),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18)),
                  Icon(
                    isButton
                        ? Icons.chevron_right
                        : (isExpanded ? Icons.expand_less : Icons.expand_more),
                    size: 28,
                  ),
                ],
              ),
            ),
          ),
          // AnimatedSize membuat isi muncul/hilang dengan animasi halus
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: isExpanded
                ? Column(children: children)
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}
