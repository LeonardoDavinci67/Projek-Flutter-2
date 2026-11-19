import 'package:flutter/material.dart';

import '../models/category_item.dart';

/// Satu bagian kategori: judul + panah, lalu grid 2x2 kotak kategori.
class CategorySection extends StatelessWidget {
  final CategorySectionData data;
  final void Function(String label) onItemTap;

  const CategorySection({
    super.key,
    required this.data,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const Icon(Icons.chevron_right, size: 30),
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth >= 900
                  ? 4
                  : constraints.maxWidth >= 560
                  ? 3
                  : 2;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.95,
                children: data.items.map((item) {
                  return GestureDetector(
                    onTap: () => onItemTap(item.label),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: item.color,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Icon(
                              item.icon,
                              size: 80,
                              color: item.accent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(item.label, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
