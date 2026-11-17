import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/search_header.dart';

/// Daftar produk berbentuk grid.
/// Bisa difilter berdasarkan [category] dan/atau kata pencarian.
class ProductListScreen extends StatefulWidget {
  final String title;
  final String? category; // null = semua kategori
  final String initialQuery;
  final void Function(Product product) onAddToCart;

  const ProductListScreen({
    super.key,
    required this.title,
    required this.onAddToCart,
    this.category,
    this.initialQuery = '',
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late String _query = widget.initialQuery;

  /// Produk yang lolos filter kategori dan kata pencarian.
  List<Product> get _results {
    return allProducts.where((product) {
      final matchCategory =
          widget.category == null || product.category == widget.category;
      final matchQuery =
          product.name.toLowerCase().contains(_query.toLowerCase());
      return matchCategory && matchQuery;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return Scaffold(
      body: Column(
        children: [
          SearchHeader(
            showBack: true,
            initialText: _query,
            onSubmitted: (text) => setState(() => _query = text),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${results.length} hasil - ${widget.title}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const Center(child: Text('Belum ada produk yang cocok.'))
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final crossAxisCount = constraints.maxWidth >= 900
                          ? 4
                          : constraints.maxWidth >= 560
                          ? 3
                          : 2;
                      final childAspectRatio = crossAxisCount == 4
                          ? 0.78
                          : crossAxisCount == 3
                          ? 0.72
                          : 0.62;

                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final product = results[index];
                          return ProductCard(
                            product: product,
                            onAddToCart: () => widget.onAddToCart(product),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
