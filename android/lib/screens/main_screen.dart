import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import 'account_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'menu_screen.dart';

/// Halaman utama dengan 4 tab di bawah: Home, Account, Cart, Menu.
/// Data keranjang disimpan DI SINI supaya semua tab bisa memakainya.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // tab yang sedang aktif
  final List<CartItem> _cart = []; // isi keranjang

  // Total semua barang (jumlah, bukan jenis) untuk badge di ikon keranjang
  int get _cartCount => _cart.fold(0, (sum, item) => sum + item.quantity);

  /// Tambah produk ke keranjang. Jika sudah ada, jumlahnya +1.
  void _addToCart(Product product) {
    setState(() {
      final index = _cart.indexWhere((item) => item.product.id == product.id);
      if (index >= 0) {
        _cart[index].quantity++;
      } else {
        _cart.add(CartItem(product: product));
      }
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} ditambahkan ke keranjang'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  /// Ubah jumlah barang (delta = +1 atau -1). Jika jadi 0, barang dihapus.
  void _changeQuantity(CartItem item, int delta) {
    setState(() {
      item.quantity += delta;
      if (item.quantity <= 0) {
        _cart.remove(item);
      }
    });
  }

  void _removeItem(CartItem item) {
    setState(() => _cart.remove(item));
  }

  void _clearCart() {
    setState(() => _cart.clear());
  }

  void _goToTab(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(onAddToCart: _addToCart),
      const AccountScreen(),
      CartScreen(
        cart: _cart,
        onChangeQuantity: _changeQuantity,
        onRemove: _removeItem,
        onCheckout: _clearCart,
        onAddToCart: _addToCart,
      ),
      MenuScreen(
        onAddToCart: _addToCart,
        onOpenAccount: () => _goToTab(1),
      ),
    ];

    return Scaffold(
      // IndexedStack menjaga posisi scroll & state tiap tab saat berpindah
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _goToTab,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.teal,
        unselectedItemColor: Colors.black87,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            activeIcon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30),
            activeIcon: Icon(Icons.person, size: 30),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('$_cartCount'),
              isLabelVisible: _cartCount > 0,
              child: const Icon(Icons.shopping_cart_outlined, size: 30),
            ),
            activeIcon: Badge(
              label: Text('$_cartCount'),
              isLabelVisible: _cartCount > 0,
              child: const Icon(Icons.shopping_cart, size: 30),
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu, size: 30),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
