import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        title: const TextField(
          autofocus: true, // Biar pas buka langsung muncul keyboard
          decoration: InputDecoration(
            hintText: 'Ketik nama alat...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: const Center(
        child: Text("Halaman Pencarian Masih Kosong"),
      ),
    );
  }
}