import 'product.dart';

/// Satu baris di keranjang: produk + jumlahnya.
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get total => product.price * quantity;
}
