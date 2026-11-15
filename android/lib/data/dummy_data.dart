import 'package:flutter/material.dart';

import '../models/category_item.dart';
import '../models/product.dart';
import '../models/promo.dart';

// ---------------------------------------------------------------
// Kartu promo BESAR (carousel di bagian atas Home)
// ---------------------------------------------------------------
const List<Promo> bigPromos = [
  Promo(
    title: 'Shop all things beauty',
    color: Color(0xFFFFC9B9),
    accent: Color(0xFFE8967F),
    icon: Icons.face_retouching_natural,
    category: 'Beauty',
  ),
  Promo(
    title: 'Start looking sharp',
    color: Color(0xFFD9D0C7),
    accent: Color(0xFF9A5B3C),
    icon: Icons.checkroom,
    category: 'Clothing',
  ),
  Promo(
    title: 'Shop must-haves',
    color: Color(0xFFBFD8DC),
    accent: Color(0xFF6C8F95),
    icon: Icons.kitchen,
    category: 'Kitchen',
  ),
  Promo(
    title: 'Gifts for little ones',
    color: Color(0xFFB5C9F0),
    accent: Color(0xFF6F8FD6),
    icon: Icons.child_friendly,
    category: 'Baby',
  ),
  Promo(
    title: "Discover books you can't put down",
    color: Color(0xFFF1EEE8),
    accent: Color(0xFFB5693F),
    icon: Icons.menu_book,
    category: 'Books',
  ),
];

// ---------------------------------------------------------------
// Kartu promo KECIL (baris horizontal di bawah carousel)
// ---------------------------------------------------------------
const List<Promo> smallPromos = [
  Promo(
    title: 'Deals Under \$50',
    color: Color(0xFFFBE98A),
    accent: Color(0xFF3A3A3A),
    icon: Icons.local_offer,
    category: 'Deals',
  ),
  Promo(
    title: 'Tech for less',
    color: Color(0xFFFF6A00),
    accent: Color(0xFF7FD1C7),
    icon: Icons.headphones,
    textColor: Colors.white,
    category: 'Headphones',
  ),
  Promo(
    title: '4+ Stars',
    color: Color(0xFFFBF1C9),
    accent: Color(0xFF2E7D4F),
    icon: Icons.backpack,
    // category null = tampilkan semua produk
  ),
  Promo(
    title: "Gifts she'll love",
    color: Color(0xFFD3EC8E),
    accent: Color(0xFFD9744A),
    icon: Icons.checkroom,
    category: 'Clothing',
  ),
  Promo(
    title: 'Organize your space',
    color: Color(0xFFF9E4D2),
    accent: Color(0xFF7BC043),
    icon: Icons.inventory_2,
    category: 'Kitchen',
  ),
  Promo(
    title: 'Gifts for gamers',
    color: Color(0xFFBFE6F7),
    accent: Color(0xFFF2A28F),
    icon: Icons.sports_esports,
    category: 'Gaming',
  ),
];

// ---------------------------------------------------------------
// Bagian kategori di Home (grid 2x2)
// ---------------------------------------------------------------
const List<CategorySectionData> homeSections = [
  CategorySectionData(
    title: 'Gear up to get fit',
    items: [
      CategoryItem(label: 'Clothing', icon: Icons.checkroom, color: Color(0xFFF3F1EE), accent: Color(0xFF2B2B2B)),
      CategoryItem(label: 'Trackers', icon: Icons.watch, color: Color(0xFFF3F1EE), accent: Color(0xFF2B2B2B)),
      CategoryItem(label: 'Equipment', icon: Icons.fitness_center, color: Color(0xFFF3F1EE), accent: Color(0xFF2B2B2B)),
      CategoryItem(label: 'Deals', icon: Icons.sell, color: Color(0xFFF3F1EE), accent: Color(0xFFD94B3D)),
    ],
  ),
  CategorySectionData(
    title: 'Plug in with our electronics',
    items: [
      CategoryItem(label: 'Headphones', icon: Icons.headphones, color: Color(0xFFF6D9CB), accent: Color(0xFF333333)),
      CategoryItem(label: 'Tablets', icon: Icons.tablet_mac, color: Color(0xFFDCD3F2), accent: Color(0xFF444B55)),
      CategoryItem(label: 'Gaming', icon: Icons.sports_esports, color: Color(0xFFE6D6F0), accent: Color(0xFF3F4A8A)),
      CategoryItem(label: 'Speakers', icon: Icons.speaker, color: Color(0xFFF8D2E2), accent: Color(0xFF2B2B2B)),
    ],
  ),
  CategorySectionData(
    title: 'Fantastic Finds for Home',
    items: [
      CategoryItem(label: 'Kitchen', icon: Icons.soup_kitchen, color: Color(0xFFEFE3D6), accent: Color(0xFFB5693F)),
      CategoryItem(label: 'Home Decor', icon: Icons.image, color: Color(0xFFE8E8E8), accent: Color(0xFFB5693F)),
      CategoryItem(label: 'Dining', icon: Icons.wine_bar, color: Color(0xFFF0E6DB), accent: Color(0xFF8A5A44)),
      CategoryItem(label: 'Furniture', icon: Icons.chair, color: Color(0xFFE6EBEF), accent: Color(0xFF5E7283)),
    ],
  ),
];

// ---------------------------------------------------------------
// Daftar produk
// ---------------------------------------------------------------
const List<Product> allProducts = [
  // 3 produk pertama dipakai sebagai "International top sellers"
  Product(id: 'p1', name: 'eos Shea Better Body Lotion - Vanilla Cashmere', category: 'Beauty', price: 9.97, rating: 4.6, reviews: 92213, icon: Icons.soap, color: Color(0xFFD6D9F7)),
  Product(id: 'p2', name: 'celimax The Vita A Retinal Shot Tightening Booster', category: 'Beauty', price: 17.48, rating: 4.4, reviews: 30763, icon: Icons.science, color: Color(0xFFEFF6B5)),
  Product(id: 'p3', name: 'medicube PDRN Pink Peptide Serum', category: 'Beauty', price: 19.99, rating: 4.3, reviews: 12840, icon: Icons.water_drop, color: Color(0xFFFAD1DC)),
  Product(id: 'p4', name: 'Makeup Brush Set with Pouch (12 pcs)', category: 'Beauty', price: 12.99, rating: 4.5, reviews: 8421, icon: Icons.brush, color: Color(0xFFFFC9B9)),

  Product(id: 'p5', name: 'Performance Running T-Shirt', category: 'Clothing', price: 24.99, rating: 4.5, reviews: 18230, icon: Icons.checkroom, color: Color(0xFFE5E5E5)),
  Product(id: 'p6', name: 'Soft Wool Blend Scarf', category: 'Clothing', price: 15.99, rating: 4.2, reviews: 3120, icon: Icons.dry_cleaning, color: Color(0xFFEBD9CC)),
  Product(id: 'p7', name: 'Leather Satchel Messenger Bag', category: 'Clothing', price: 45.00, rating: 4.4, reviews: 5604, icon: Icons.work, color: Color(0xFFE6CBB3)),
  Product(id: 'p8', name: 'Cozy Knit Sweater for Women', category: 'Clothing', price: 32.50, rating: 4.1, reviews: 2210, icon: Icons.checkroom, color: Color(0xFFF2E8DA)),

  Product(id: 'p9', name: 'Fitness Tracker Band with Heart Rate', category: 'Trackers', price: 39.99, rating: 4.3, reviews: 14502, icon: Icons.watch, color: Color(0xFFFFE680)),
  Product(id: 'p10', name: 'Smart Watch for Android and iPhone', category: 'Trackers', price: 79.99, rating: 4.4, reviews: 9870, icon: Icons.watch_outlined, color: Color(0xFFFFE680)),

  Product(id: 'p11', name: 'Adjustable Dumbbell Set (40 lb)', category: 'Equipment', price: 89.99, rating: 4.6, reviews: 7312, icon: Icons.fitness_center, color: Color(0xFFE5E5E5)),
  Product(id: 'p12', name: 'Cast Iron Kettlebell 20 lb', category: 'Equipment', price: 29.99, rating: 4.7, reviews: 11250, icon: Icons.sports_gymnastics, color: Color(0xFFE5E5E5)),
  Product(id: 'p13', name: 'Non-Slip Yoga Mat', category: 'Equipment', price: 18.99, rating: 4.5, reviews: 20418, icon: Icons.self_improvement, color: Color(0xFFD7EFD9)),

  Product(id: 'p14', name: 'Insulated Tumbler with Handle (40 oz)', category: 'Deals', price: 17.99, rating: 4.7, reviews: 54012, icon: Icons.local_drink, color: Color(0xFFD9DDF7)),
  Product(id: 'p15', name: 'Puffer Tote Bag', category: 'Deals', price: 24.99, rating: 4.3, reviews: 1830, icon: Icons.shopping_bag, color: Color(0xFFFBE98A)),

  Product(id: 'p16', name: 'Wireless Noise Cancelling Headphones', category: 'Headphones', price: 49.99, rating: 4.4, reviews: 22340, icon: Icons.headphones, color: Color(0xFFF6D9CB)),
  Product(id: 'p17', name: 'True Wireless Earbuds with Case', category: 'Headphones', price: 25.99, rating: 4.2, reviews: 16780, icon: Icons.earbuds, color: Color(0xFFF6D9CB)),

  Product(id: 'p18', name: '10-inch Android Tablet 64GB', category: 'Tablets', price: 149.99, rating: 4.3, reviews: 6120, icon: Icons.tablet_mac, color: Color(0xFFDCD3F2)),
  Product(id: 'p19', name: 'Tablet Case with Stand', category: 'Tablets', price: 14.99, rating: 4.5, reviews: 4310, icon: Icons.tablet, color: Color(0xFFDCD3F2)),

  Product(id: 'p20', name: 'Wireless Game Controller', category: 'Gaming', price: 59.99, rating: 4.7, reviews: 31200, icon: Icons.sports_esports, color: Color(0xFFE6D6F0)),
  Product(id: 'p21', name: 'Gaming Headset with Microphone', category: 'Gaming', price: 34.99, rating: 4.4, reviews: 9005, icon: Icons.headset_mic, color: Color(0xFFE6D6F0)),

  Product(id: 'p22', name: 'Portable Bluetooth Party Speaker', category: 'Speakers', price: 69.99, rating: 4.6, reviews: 12688, icon: Icons.speaker, color: Color(0xFFF8D2E2)),
  Product(id: 'p23', name: 'Mini Waterproof Speaker', category: 'Speakers', price: 19.99, rating: 4.3, reviews: 7745, icon: Icons.speaker_group, color: Color(0xFFF8D2E2)),

  Product(id: 'p24', name: 'Glass Food Storage Containers (3 pack)', category: 'Kitchen', price: 22.99, rating: 4.6, reviews: 15330, icon: Icons.lunch_dining, color: Color(0xFFD7EFB8)),
  Product(id: 'p25', name: 'Non-Stick Loaf Baking Pan', category: 'Kitchen', price: 11.49, rating: 4.7, reviews: 8902, icon: Icons.bakery_dining, color: Color(0xFFEFE3D6)),
  Product(id: 'p26', name: '2-Slice Retro Toaster', category: 'Kitchen', price: 29.99, rating: 4.4, reviews: 5211, icon: Icons.breakfast_dining, color: Color(0xFFFFE680)),

  Product(id: 'p27', name: 'Framed Abstract Wall Art', category: 'Home Decor', price: 27.99, rating: 4.4, reviews: 2870, icon: Icons.image, color: Color(0xFFE8E8E8)),
  Product(id: 'p28', name: 'Ceramic Flower Vase', category: 'Home Decor', price: 16.99, rating: 4.5, reviews: 3602, icon: Icons.local_florist, color: Color(0xFFEFE3D6)),

  Product(id: 'p29', name: 'Crystal Wine Glass Set (6 pcs)', category: 'Dining', price: 28.99, rating: 4.5, reviews: 6420, icon: Icons.wine_bar, color: Color(0xFFF0E6DB)),
  Product(id: 'p30', name: 'Modern Accent Chair', category: 'Furniture', price: 129.00, rating: 4.2, reviews: 1540, icon: Icons.chair, color: Color(0xFFE6EBEF)),

  Product(id: 'p31', name: 'Bestselling Mystery Novel', category: 'Books', price: 13.99, rating: 4.6, reviews: 48210, icon: Icons.menu_book, color: Color(0xFFF1EEE8)),
  Product(id: 'p32', name: 'Easy Home Cookbook', category: 'Books', price: 21.99, rating: 4.7, reviews: 19320, icon: Icons.auto_stories, color: Color(0xFFF1EEE8)),

  Product(id: 'p33', name: 'Plush Teddy Bear', category: 'Baby', price: 14.99, rating: 4.8, reviews: 10345, icon: Icons.toys, color: Color(0xFFB5C9F0)),
  Product(id: 'p34', name: 'Wooden Teether Toy Set', category: 'Baby', price: 9.99, rating: 4.6, reviews: 4120, icon: Icons.child_friendly, color: Color(0xFFB5C9F0)),
];

/// 3 produk pertama untuk "International top sellers" di halaman Cart.
final List<Product> topSellers = allProducts.take(3).toList();

// ---------------------------------------------------------------
// Menu "Shop by Department": nama departemen -> kategori produk
// ---------------------------------------------------------------
const Map<String, String> departments = {
  'Arts & Crafts': 'Arts & Crafts',
  'Automotive Parts & Accessories': 'Automotive',
  'Baby': 'Baby',
  'Beauty & Personal Care': 'Beauty',
  'Computers': 'Computers',
  'Books': 'Books',
  'Digital Music': 'Digital Music',
  'Electronics': 'Headphones',
  "Women's Fashion": 'Clothing',
  "Men's Fashion": 'Clothing',
};

/// Daftar negara untuk pilihan "Deliver to".
const List<String> countries = [
  'Indonesia',
  'United States',
  'Singapore',
  'Malaysia',
  'Japan',
  'Australia',
];

