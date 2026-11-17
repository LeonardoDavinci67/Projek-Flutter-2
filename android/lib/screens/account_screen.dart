import 'package:flutter/material.dart';

import '../widgets/search_header.dart';

/// Halaman Account: sapaan nama, tab chip, dan beberapa bagian (Orders, Interests, Lists).
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _name = 'Adib';
  int _selectedChip = -1; // -1 = belum ada chip yang dipilih
  final List<String> _interests = [];
  final List<String> _lists = [];

  final List<String> _chipLabels = ['Orders', 'Interests', 'Account', 'Lists'];

  /// Menampilkan dialog dengan satu kolom teks. Mengembalikan teks yang diketik
  /// (atau null jika dibatalkan).
  Future<String?> _askText(String title, String hint, {String initial = ''}) {
    final controller = TextEditingController(text: initial);
    return showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(hintText: hint),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, controller.text.trim()),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _changeName() async {
    final result = await _askText('Ubah nama', 'Nama kamu', initial: _name);
    if (result != null && result.isNotEmpty) {
      setState(() => _name = result);
    }
  }

  Future<void> _addInterest() async {
    final result = await _askText('Create a new Interest', 'Contoh: Photography');
    if (result != null && result.isNotEmpty) {
      setState(() => _interests.add(result));
    }
  }

  Future<void> _addList() async {
    final result = await _askText('Create a List', 'Nama daftar, contoh: Wishlist');
    if (result != null && result.isNotEmpty) {
      setState(() => _lists.add(result));
    }
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchHeader(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // ---------- Sapaan + ikon ----------
              LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: _changeName,
                        child: Row(
                          children: [
                            Text(
                              'Hello, $_name',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Icon(Icons.expand_more),
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.settings_outlined),
                        onPressed: () =>
                            _showMessage('Pengaturan belum tersedia'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none),
                        onPressed: () =>
                            _showMessage('Tidak ada notifikasi baru'),
                      ),
                      if (constraints.maxWidth >= 320)
                        const Text('🇺🇸 EN', style: TextStyle(fontSize: 16)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 12),

              // ---------- Chip pilihan ----------
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < _chipLabels.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(_chipLabels[i]),
                          selected: _selectedChip == i,
                          onSelected: (_) => setState(() => _selectedChip = i),
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.black38),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // ---------- Bagian-bagian ----------
              _AccountSection(
                title: 'Your Orders',
                emptyText: 'No recent order found.',
                buttonText: 'See all orders',
                onPressed: () => _showMessage('Belum ada pesanan'),
              ),
              _AccountSection(
                title: 'Buy Again',
                emptyText: 'See what others are reordering on Buy Again',
                buttonText: 'Visit Buy Again',
                fullWidthButton: true,
                onPressed: () => _showMessage('Buy Again belum tersedia'),
              ),
              _AccountSection(
                title: 'Your Interests',
                emptyText: 'You do not have any Interests yet.',
                buttonText: 'Create a new Interest',
                fullWidthButton: true,
                items: _interests,
                onPressed: _addInterest,
              ),
              _AccountSection(
                title: 'Lists and Registries',
                emptyText: "You haven't created any lists.",
                buttonText: 'Create a List',
                fullWidthButton: true,
                items: _lists,
                onPressed: _addList,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Satu bagian di halaman Account: judul, teks kosong (atau daftar item), dan tombol.
class _AccountSection extends StatelessWidget {
  final String title;
  final String emptyText;
  final String buttonText;
  final VoidCallback onPressed;
  final bool fullWidthButton;
  final List<String> items;

  const _AccountSection({
    required this.title,
    required this.emptyText,
    required this.buttonText,
    required this.onPressed,
    this.fullWidthButton = false,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              const Icon(Icons.arrow_forward, size: 28),
            ],
          ),
          const SizedBox(height: 8),
          if (items.isEmpty)
            Text(emptyText, style: const TextStyle(fontSize: 17, color: Colors.black54))
          else
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: items.map((text) => Chip(label: Text(text))).toList(),
            ),
          const SizedBox(height: 12),
          SizedBox(
            width: fullWidthButton ? double.infinity : null,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                side: const BorderSide(color: Colors.black26),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(buttonText, style: const TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
