import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// =========================================================
// #1. BAGIAN PENGATURAN TEMA & WARNA (Kuning, Orange, Hitam)
// =========================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Tool',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF212121), // Hitam Arang
          foregroundColor: Color(0xFFF3D421), // Kuning J4 Kakak
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF3D421),
          primary: const Color(0xFF212121),
          secondary: const Color(0xFFFF9800), // Orange
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'E-Tool'),
    );
  }
}

// =========================================================
// #2. BAGIAN TAMPILAN MENU UTAMA (REKOMENDASI ALAT)
// =========================================================
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
        title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- BARIS CARI & FAVORIT ---
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
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
                ],
              ),
              const SizedBox(height: 25),
              const Text('Rekomendasi Alat untuk Anda', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              
              // Memanggil Item Alat
              _buildToolItem("Mesin Molen Beton", "Rp 150.000 / hari", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDGvsr1gFmVIJTP_wtS30qv-qJ2K5LLBn_lQ&s"),
              _buildToolItem("Mesin Bor", "Rp 50.000 / hari", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s"),
              _buildToolItem("Gergaji Potong", "Rp 55.000 / hari", "https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764"),
            ],
          ),
        ),
      ),
    );
  }

  // #FUNGSI UNTUK MEMBUAT KOTAK ITEM ALAT
  Widget _buildToolItem(String name, String price, String imageUrl) {
    return InkWell(
      onTap: () {
        // PINDAH KE HALAMAN DETAIL (BAGIAN #4)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailAlatPage(name: name, price: price, imageUrl: imageUrl)),
        );
      },
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
              child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(price, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
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

// =========================================================
// #3. BAGIAN TAMPILAN PENCARIAN & KATEGORI (GESER)
// =========================================================
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const TextField(autofocus: true, decoration: InputDecoration(hintText: 'Cari Alat...', border: InputBorder.none)),
      ),
      body: const Center(child: Text("Halaman Kategori & Search")),
    );
  }
}

// =========================================================
// #4. BAGIAN TAMPILAN DETAIL ALAT (SESUAI SKETSA BUKU KAKAK)
// =========================================================
class DetailAlatPage extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const DetailAlatPage({super.key, required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Alat")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Besar di Atas
            Image.network(imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text(price, style: const TextStyle(fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text("Spesifikasi:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("• Kondisi alat sangat prima\n• Siap antar ke lokasi\n• Harga sewa termurah"),
                  const SizedBox(height: 40),
                  
                  // Tombol SEWA & FAVORIT Sejajar (Row)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800), foregroundColor: Colors.white),
                          onPressed: () {}, 
                          child: const Text("SEWA")
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {}, 
                          child: const Text("FAVORIT", style: TextStyle(color: Colors.black))
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}