import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Kotak pencarian di bagian atas semua halaman.
/// - [showBack] menampilkan tombol panah kembali
/// - [onSubmitted] dipanggil saat pengguna menekan tombol "search" di keyboard
class SearchHeader extends StatefulWidget {
  final Color backgroundColor;
  final bool showBack;
  final String initialText;
  final ValueChanged<String>? onSubmitted;

  const SearchHeader({
    super.key,
    this.backgroundColor = AppColors.headerOrange,
    this.showBack = false,
    this.initialText = '',
    this.onSubmitted,
  });

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showFakeFeature(String name) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name belum tersedia (hanya tampilan)'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(widget.showBack ? 4 : 16, 8, 16, 12),
          child: Row(
            children: [
              if (widget.showBack)
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              Expanded(
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black87, width: 1.2),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.search, size: 26),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          textInputAction: TextInputAction.search,
                          onSubmitted: widget.onSubmitted,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Search Amazon.com',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.photo_camera_outlined),
                        onPressed: () => _showFakeFeature('Pencarian kamera'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.mic_none),
                        onPressed: () => _showFakeFeature('Pencarian suara'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
