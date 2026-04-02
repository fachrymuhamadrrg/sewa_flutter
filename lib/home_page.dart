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
          style: TextStyle(
            color: Color(0xFFF3D421),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                        MaterialPageRoute(
                          builder: (context) => const HistoryPage(),
                        ),
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
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ), // Mengarah ke profile_page.dart
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
                'Hai, mau sewa apa hari ini?',
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
              _buildToolItem(
                "Mesin Las",
                "Rp 55.000 / hari",
                "data:image/jpeg;base64,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",
                "Merek: Lakoni\nDaya: 1050 Watt\nDiameter Pisau: 185mm\nKecepatan: 4900 rpm",
              ),
              _buildToolItem(
                "Scaffolding (Steger)",
                "Rp 20.000 / set / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw9JJkId8KHnKPBRZGXQPnj_OzG-OBzzkLJQ&s", // Ganti dengan link gambar steger
                "Tipe: Main Frame 1.7m\nMaterial: Steel Pipe\nTermasuk: 2 Frame, 2 Crossbrace, 4 Join Pin",
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
