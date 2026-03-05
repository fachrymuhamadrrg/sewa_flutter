import 'package:flutter/material.dart';

class DetailAlatPage extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String specs; // <--- Ini yang bikin error tadi kalau belum ada

  const DetailAlatPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.specs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(price, style: const TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  
                  // --- BAGIAN SPESIFIKASI TEKNIS ---
                  const Text("Spesifikasi Teknis", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      specs,
                      style: const TextStyle(fontSize: 15, height: 1.8),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Tombol Sewa
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF3D421),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text("SEWA SEKARANG", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}