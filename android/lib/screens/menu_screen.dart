import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';
import '../widgets/expandable_box.dart';
import '../widgets/search_header.dart';
import 'product_list_screen.dart';

/// Halaman Menu: shortcut, Shop by Department, Settings, dan Customer Service.
class MenuScreen extends StatefulWidget {
  final void Function(Product product) onAddToCart;
  final VoidCallback onOpenAccount;

  const MenuScreen({
    super.key,
    required this.onAddToCart,
    required this.onOpenAccount,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Kotak yang sedang terbuka: -1 = semua tertutup, 0 = Department, 1 = Settings
  int _openIndex = -1;
  bool _notificationsOn = true;

  /// Buka/tutup kotak. Hanya satu kotak yang terbuka dalam satu waktu.
  void _toggle(int index) {
    setState(() => _openIndex = (_openIndex == index) ? -1 : index);
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  void _openDepartment(String label, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductListScreen(
          title: label,
          category: category,
          onAddToCart: widget.onAddToCart,
        ),
      ),
    );
  }

  void _confirmSignOut() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Yakin ingin keluar dari akun?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                _showMessage('Berhasil sign out (simulasi)');
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }

  /// Satu baris teks di dalam kotak yang terbuka.
  Widget _row(String text, {VoidCallback? onTap, Widget? trailing}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(text, style: const TextStyle(fontSize: 18)),
      trailing: trailing,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchHeader(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // ---------- Shortcuts ----------
              const Text(
                'Your shortcuts',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  for (final label in ['Orders', 'Lists', 'Account'])
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ActionChip(
                        label: Text(label, style: const TextStyle(fontSize: 16)),
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder(side: BorderSide(color: Colors.black38)),
                        onPressed: widget.onOpenAccount, // pindah ke tab Account
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 12),

              // ---------- Shop by category ----------
              const Text(
                'Shop by category',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),

              ExpandableBox(
                title: 'Shop by Department',
                isExpanded: _openIndex == 0,
                onTap: () => _toggle(0),
                children: [
                  for (final entry in departments.entries)
                    _row(entry.key, onTap: () => _openDepartment(entry.key, entry.value)),
                ],
              ),

              ExpandableBox(
                title: 'Settings',
                isExpanded: _openIndex == 1,
                onTap: () => _toggle(1),
                children: [
                  _row(
                    'Notifications',
                    trailing: Switch(
                      value: _notificationsOn,
                      onChanged: (value) => setState(() => _notificationsOn = value),
                    ),
                    onTap: () => setState(() => _notificationsOn = !_notificationsOn),
                  ),
                  _row('Manage App Storage', onTap: () => _showMessage('Penyimpanan: 0 MB dipakai')),
                  const Divider(indent: 20, endIndent: 20),
                  _row('Rate Our App', onTap: () => _showMessage('Terima kasih atas penilaianmu!')),
                  _row(
                    'Legal & About',
                    onTap: () => showAboutDialog(
                      context: context,
                      applicationName: 'Amazon Replica',
                      applicationVersion: '1.0.0',
                      children: const [Text('Replika tampilan untuk latihan Flutter (frontend saja).')],
                    ),
                  ),
                  const Divider(indent: 20, endIndent: 20),
                  _row('Switch Accounts', onTap: () => _showMessage('Switch Accounts belum tersedia')),
                  _row('Sign Out', onTap: _confirmSignOut),
                ],
              ),

              // Tanpa children = tampil sebagai tombol dengan panah ke kanan
              ExpandableBox(
                title: 'Customer Service',
                isExpanded: false,
                onTap: () => _showMessage('Menghubungkan ke Customer Service (simulasi)'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
