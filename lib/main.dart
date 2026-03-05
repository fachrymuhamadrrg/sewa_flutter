import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Tool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF3D421)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'E-Tool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3D421),
        foregroundColor: Colors.white,
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER SEARCH ---
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Expanded(child: Text('Cari Alat...', style: TextStyle(color: Colors.grey))),
                          Icon(Icons.search, color: Colors.grey)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.favorite_border, color: Colors.red, size: 30),
                  const SizedBox(width: 8),
                  const Column(
                    children: [
                      Icon(Icons.chat_bubble_outline, size: 24),
                      Text('Chat', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text('REKOMENDASI ALAT UNTUK ANDA', 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // ============================================================
              // BAGIAN 1: PEMANGGILAN DATA ALAT
              // ============================================================
              _buildToolItem(
                "Mesin Molen Beton",
                "Rp 150.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDGvsr1gFmVIJTP_wtS30qv-qJ2K5LLBn_lQ&s", 
              ),
              _buildToolItem(
                "Mesin Bor Beton",
                "Rp 50.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s", 
              ),
              _buildToolItem(
                "Gergaji Potong",
                "Rp 55.000 / hari",
                "https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764", 
              ),
              _buildToolItem(
                "Palu Godam 5kg",
                "Rp 20.000 / hari",
                "https://tehniq.com/cdn/shop/products/LIPPROCopperHammerSize5kg_800x_crop_center.jpg?v=1606447412", 
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BAGIAN 2: MESINNYA (Sudah diperbaiki untuk menampilkan gambar)
  // ============================================================
  Widget _buildToolItem(String name, String price, String imageUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // SEKARANG SUDAH PAKAI IMAGE, BUKAN ICON LAGI
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              // Animasi loading saat gambar sedang didownload
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 80, 
                  height: 80, 
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                );
              },
              // Muncul jika link rusak atau tidak ada internet
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80, 
                height: 80, 
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Icon(Icons.add_circle_outline, color: Colors.blue),
        ],
      ),
    );
  }
}