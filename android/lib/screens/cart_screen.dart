import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/cart_item.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../widgets/product_card.dart';
import '../widgets/search_header.dart';

/// Halaman keranjang. Tampilan berubah jika keranjang kosong / berisi.
class CartScreen extends StatefulWidget {
  final List<CartItem> cart;
  final void Function(CartItem item, int delta) onChangeQuantity;
  final void Function(CartItem item) onRemove;
  final VoidCallback onCheckout;
  final void Function(Product product) onAddToCart;

  const CartScreen({
    super.key,
    required this.cart,
    required this.onChangeQuantity,
    required this.onRemove,
    required this.onCheckout,
    required this.onAddToCart,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _primeActive = false; // sudah klik free trial Prime atau belum

  double get _subtotal =>
      widget.cart.fold(0.0, (sum, item) => sum + item.total);

  int get _itemCount =>
      widget.cart.fold(0, (sum, item) => sum + item.quantity);

  /// Dialog konfirmasi checkout.
  void _checkout() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Checkout'),
          content: Text(
            'Total \$${_subtotal.toStringAsFixed(2)} untuk $_itemCount barang. Lanjutkan pesanan?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                widget.onCheckout();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pesanan berhasil dibuat (simulasi)')),
                );
              },
              child: const Text('Pesan'),
            ),
          ],
        );
      },
    );
  }

  // ---------- Bagian-bagian tampilan ----------

  Widget _buildEmptyHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFE3F1FA),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shopping_cart, size: 50, color: AppColors.yellow),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Amazon Cart is empty',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 4),
                Text('Echo... Echo...', style: TextStyle(fontSize: 18, color: Colors.black54)),
                SizedBox(height: 8),
                Text(
                  'Pick up where you left off',
                  style: TextStyle(fontSize: 18, color: AppColors.teal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimeBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primeBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'prime',
                style: TextStyle(
                  color: AppColors.teal,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  _primeActive
                      ? 'Free trial Prime aktif. Selamat berbelanja!'
                      : 'Fast, FREE delivery on eligible items with a 30-day trial for \$0',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          if (!_primeActive) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => setState(() => _primeActive = true),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Accept your free trial of Prime Shipping',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSubtotal() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subtotal \$${_subtotal.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _checkout,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                foregroundColor: Colors.black,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: const StadiumBorder(),
              ),
              child: Text(
                'Proceed to checkout ($_itemCount items)',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: item.product.color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.product.icon, size: 44, color: Colors.black54),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, color: AppColors.link),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${item.product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    // Tombol - dan + untuk mengubah jumlah
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => widget.onChangeQuantity(item, -1),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                item.quantity == 1 ? Icons.delete_outline : Icons.remove,
                                size: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
                          ),
                          InkWell(
                            onTap: () => widget.onChangeQuantity(item, 1),
                            child: const Padding(
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.add, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () => widget.onRemove(item),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSellers() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'International top sellers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: topSellers.length,
              itemBuilder: (context, index) {
                final product = topSellers[index];
                return SizedBox(
                  width: 160,
                  child: ProductCard(
                    product: product,
                    onAddToCart: () => widget.onAddToCart(product),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = widget.cart.isEmpty;

    return Column(
      children: [
        const SearchHeader(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              if (isEmpty) ...[
                _buildEmptyHeader(),
                _buildPrimeBox(),
              ] else ...[
                _buildSubtotal(),
                for (final item in widget.cart) _buildCartItem(item),
                const SizedBox(height: 8),
              ],
              _buildTopSellers(),
            ],
          ),
        ),
      ],
    );
  }
}
