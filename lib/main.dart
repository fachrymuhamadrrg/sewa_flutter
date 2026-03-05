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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SearchPage()),
                        );
                      },
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

              const Text('Relomendasi Alat untuk Anda', 
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
                "Mesin Bor",
                "Rp 50.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s", 
              ),
              _buildToolItem(
                "Gergaji Potong",
                "Rp 55.000 / hari",
                "https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764", 
              ),
              _buildToolItem(
                "Palu 5kg",
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
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: 'Cari Alat...', border: InputBorder.none),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Kategori", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          // Bagian Geser (Horizontal)
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCat("Bor","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s"),
                _buildCat("Gergaji","https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764"),
                _buildCat("Molen","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDGvsr1gFmVIJTP_wtS30qv-qJ2K5LLBn_lQ&s"),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Terakhir dicari oleh anda", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          // Bagian Kapsul (Chips)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 10,
              children: [
                _buildChip("Bor Beton"),
                _buildChip("Molen"),
                _buildChip("Gergaji"),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildCat(String txt, String imgUrl) { // <--- ic (IconData) diganti jadi imgUrl (String)
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          // Pakai Image.network buat nampilin foto asli dari link
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imgUrl, // <--- Memanggil link gambar yang dikirim
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
            ),
          ),
          const SizedBox(height: 5),
          Text(txt, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(label: Text(label), onDeleted: () {}, deleteIcon: const Icon(Icons.close, size: 14));
  }
}