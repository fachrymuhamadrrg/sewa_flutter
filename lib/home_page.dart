import 'package:flutter/material.dart';
// IMPORT HALAMAN-HALAMAN TUJUAN UNTUK NAVIGASI (PINDAH LAYAR)
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
      // --- 1. BAGIAN APPBAR (KEPALA APLIKASI) ---
      appBar: AppBar(
        title: const Text(
          "Ambatukang",
          style: TextStyle(
            color: Color(0xFFF3D421), // WARNA KUNING EMAS KHAS AMBATUKANG
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black, // BACKGROUND HITAM BIAR SANGAR
        elevation: 0, // MENGHILANGKAN BAYANGAN APPBAR
      ),

      // --- 2. BAGIAN UTAMA (BODY) DENGAN SAFEAREA AGAR TIDAK KEPOTONG PONI HP ---
      body: SafeArea(
        child: SingleChildScrollView(
          // SUPAYA HALAMAN BISA DI-SCROLL KE BAWAH KALAU DAFTARNYA BANYAK
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 3. BARIS MENU NAVIGASI (SEARCH, FAVORIT, RIWAYAT, PROFIL) ---
              Row(
                children: [
                  // EXPANDED MEMBUAT KOTAK SEARCH MENGISI SISA RUANG YANG ADA
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ),
                      ),
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade50,
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Cari Alat Tukang...',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // MEMANGGIL FUNGSI ICON NAVIGASI (FAVORIT, RIWAYAT, PROFIL)
                  _buildNavIcon(
                    Icons.favorite_border,
                    const Color(0xFFD8A005),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritePage(),
                      ),
                    ),
                  ),
                  _buildNavIcon(
                    Icons.receipt_long,
                    const Color(0xFF553F01),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryPage(),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFF3D421),
                      child: Icon(Icons.person, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                'KATALOG ALAT TERSEDIA',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // --- 4. DAFTAR PRODUK (MEMANGGIL FUNGSI _BUILDTOOLITEM) ---
              _buildToolItem(
                "Mesin Molen Beton",
                "Rp 150.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDGvsr1gFmVIJTP_wtS30qv-qJ2K5LLBn_lQ&s",
                "Merek: Tiger\nKapasitas: 500 Liter\nMesin: Dongfeng 8 HP",
              ),
              _buildToolItem(
                "Mesin Bor Listrik",
                "Rp 50.000 / hari",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s",
                "Merek: Bosch GSB 550\nDaya: 550 Watt\nFitur: Reversible",
              ),
              _buildToolItem(
                "Gergaji Mesin",
                "Rp 55.000 / hari",
                "https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764",
                "Merek: Maktec MT583\nDaya: 1050 Watt",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- 5. FUNGSI HELPER UNTUK IKON NAVIGASI ---
  Widget _buildNavIcon(IconData icon, Color color, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }

  // --- 6. FUNGSI HELPER UNTUK MEMBUAT KARTU DAFTAR ALAT (REUSABLE WIDGET) ---
  Widget _buildToolItem(
    String name,
    String price,
    String imageUrl,
    String specs,
  ) {
    return InkWell(
      onTap: () {
        // NAVIGATOR PUSH UNTUK PINDAH KE HALAMAN DETAIL DAN MELEMPARKAN DATA ALAT
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAlatPage(
              name: name,
              price: price,
              imageUrl: imageUrl,
              specs: specs,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // CLIPRRECT UNTUK MEMBUAT GAMBAR PRODUK PUNYA SUDUT MELENGKUNG (ROUNDED)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            // INFORMASI TEKS ALAT (NAMA DAN HARGA)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
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
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
