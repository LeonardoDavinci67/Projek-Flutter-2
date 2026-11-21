import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';
import '../widgets/category_section.dart';
import '../widgets/promo_card.dart';
import '../widgets/search_header.dart';
import 'product_list_screen.dart';

/// Halaman Home: pencarian, lokasi pengiriman, carousel promo, dan kategori.
class HomeScreen extends StatefulWidget {
  final void Function(Product product) onAddToCart;

  const HomeScreen({super.key, required this.onAddToCart});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // viewportFraction < 1 membuat kartu sebelah/berikutnya sedikit terlihat
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _currentPage = 0; // kartu carousel yang sedang tampil
  String _country = 'Indonesia'; // tujuan pengiriman

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Buka halaman daftar produk.
  void _openList(String title, {String? category, String query = ''}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductListScreen(
          title: title,
          category: category,
          initialQuery: query,
          onAddToCart: widget.onAddToCart,
        ),
      ),
    );
  }

  /// Tampilkan pilihan negara di bottom sheet.
  void _pickCountry() {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Choose your location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              for (final country in countries)
                ListTile(
                  title: Text(country),
                  trailing: country == _country
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    setState(() => _country = country);
                    Navigator.pop(sheetContext);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Warna latar atas mengikuti warna kartu carousel yang aktif
    final topColor = bigPromos[_currentPage].color;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [topColor, Colors.white],
          stops: const [0.0, 0.5],
        ),
      ),
      child: Column(
        children: [
          SearchHeader(
            backgroundColor: Colors.transparent,
            onSubmitted: (text) => _openList('Search results', query: text),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // ---------- Baris "Deliver to" ----------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: _pickCountry,
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(180),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Deliver to $_country',
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                          const Icon(Icons.expand_more),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // ---------- Carousel kartu besar ----------
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    key: const PageStorageKey<String>('home-promo-carousel'),
                    controller: _pageController,
                    itemCount: bigPromos.length,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    itemBuilder: (context, index) {
                      final promo = bigPromos[index];
                      return PromoCard(
                        promo: promo,
                        onTap: () =>
                            _openList(promo.title, category: promo.category),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // ---------- Bagian putih di bawah carousel ----------
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 4, bottom: 24),
                  child: Column(
                    children: [
                      // Kartu promo kecil (geser ke samping)
                      SizedBox(
                        height: 190,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: smallPromos.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final promo = smallPromos[index];
                            return SizedBox(
                              width: 150,
                              child: PromoCard(
                                promo: promo,
                                small: true,
                                onTap: () => _openList(
                                  promo.title,
                                  category: promo.category,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Bagian kategori
                      for (final section in homeSections)
                        CategorySection(
                          data: section,
                          onItemTap: (label) =>
                              _openList(label, category: label),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
