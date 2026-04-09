import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // --- BAGIAN NAVIGASI BAWAH (BOTTOM NAVIGATION BAR) ---
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(
          0xFFF05412,
        ), // WARNA ORANYE UNTUK ITEM AKTIF
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Pengaturan',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER: LOKASI, NOTIFIKASI, DAN PROFIL ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "Ponorogo, Jawa Timur",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                        ),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?u=kakak',
                        ), // FOTO PROFIL
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- JUDUL UTAMA ---
              const Text(
                "Temukan\nAlat Terbaikmu",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),

              // --- KOTAK PENCARIAN (SEARCH BAR) ---
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari Alat",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFF05412),
                  ),
                  suffixIcon: const Icon(
                    Icons.tune,
                    color: Colors.black,
                  ), // IKON FILTER
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- KATEGORI (HORIZONTAL LIST) ---
              const SizedBox(height: 25),

              // --- SUBJUDUL DAFTAR TERDEKAT ---
              const Text(
                "Alat Terdekat",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // --- GRID DAFTAR PRODUK (ALAT TUKANG) ---
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.75,
                children: [
                  _buildToolCard(
                    "Stamper Kuda / Tamping Rammer Compactor",
                    "Ponorogo",
                    "Rp 300,000",
                    "https://image1ws.indotrading.com/s3/productimages/webp/co35493/p251897/w300-h300/65b1da26-c1ea-41ac-8e00-ea71ef59edf5w.jpg",
                  ),
                  _buildToolCard(
                    "Mesin Senso Gergaji Rantai / Chain Saw Machine",
                    "Ponorogo",
                    "Rp 150.000",
                    "https://image1ws.indotrading.com/s3/productimages/webp/co283020/p1663341/w600-h600/57a24e25-1def-4b48-91ad-3b9c3a6d1593.jpg",
                  ),
                  _buildToolCard(
                    "Mesin Pemotong Beton / Concrete Cutter Machine",
                    "Ponorogo",
                    "Rp 600,000",
                    "https://image1ws.indotrading.com/s3/productimages/webp/co170930/p980577/w600-h600/510766d2-1c1b-4018-869d-e058090ed768.jpg",
                  ),
                  _buildToolCard(
                    "Mesin Penghancur Beton / Concrete Breaker",
                    "Ponorogo",
                    "Rp 200,000",
                    "https://image1ws.indotrading.com/s3/productimages/webp/co170930/p1339243/w600-h600/f1eb6d48-9928-4ecb-aebb-f8db0b8d49a7.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET UNTUK KARTU PRODUK (GRID ITEM) ---
  Widget _buildToolCard(String name, String loc, String price, String imgUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GAMBAR PRODUK DENGAN HARGA DAN RATING
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Rp $price/Hari",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // INFORMASI TEKS DI BAWAH GAMBAR
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      loc,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
