import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'search_page.dart';
import 'favorite_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

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
      // Buka home_page.dart, cari bagian AppBar dan ganti jadi ini:
      appBar: AppBar(
        title: const Text(
          "E-Tool",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF3D421),
        elevation: 0,
        // KOSONGKAN ACTIONS BIAR TIDAK DOBEL DENGAN YANG BAWAH
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- BARIS CARI & FAVORIT (VERSI FIX) ---
              // --- BARIS MENU ATAS (SEARCH, FAVORIT, RIWAYAT, AKUN) ---
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade50,
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey, size: 20),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Cari Alat...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Icon Favorit
                  GestureDetector(
                    onTap: () {
                      // Karena Anda sudah import favorite_page.dart, kita arahkan ke sana
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritePage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0xFFD8A005),
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Icon Riwayat

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryPage()),
                       );
                      },
                    child: const Icon(
                    Icons.receipt_long,
                    color: Color(0xFF553F01),
                    size: 26, 
                    ),
                      ),
                  const SizedBox(width: 8),
                  // icon acount
                    GestureDetector(
                      onTap: () {
                       Navigator.push(
                          context,
                           MaterialPageRoute(builder: (context) => const ProfilePage()), // Mengarah ke profile_page.dart
                         );
                        },
                          child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFF3D421),
                          child: Icon(Icons.person, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
              ),
              const SizedBox(height: 25),
              const Text(
                'Rekomendasi Alat untuk Anda',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Memanggil Daftar Alat
              // Update Daftar Alat dengan Spesifikasi Teknis
              _buildToolItem(
                "Mesin Molen Beton",
                "Rp 150.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDGvsr1gFmVIJTP_wtS30qv-qJ2K5LLBn_lQ&s",
                "Merek: Tiger\nKapasitas: 500 Liter\nMesin: Dongfeng 8 HP\nBahan Bakar: Solar",
              ),
              _buildToolItem(
                "Mesin Bor",
                "Rp 50.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s",
                "Merek: Bosch GSB 550\nDaya: 550 Watt\nKecepatan: 2800 rpm\nFitur: Reversible",
              ),
              _buildToolItem(
                "Gergaji Potong",
                "Rp 55.000 / hari",
                "https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764",
                "Merek: Maktec MT583\nDaya: 1050 Watt\nDiameter Pisau: 185mm\nKecepatan: 4900 rpm",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolItem(
    String name,
    String price,
    String imageUrl,
    String specs,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAlatPage(
              name: name,
              price: price,
              imageUrl: imageUrl,
              specs: specs, // Kirim spek teknis ke halaman detail
            ),
          ),
        );
      },
      // ... sisa kode Container tetap sama ...
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
