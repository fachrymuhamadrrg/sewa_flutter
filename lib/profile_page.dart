import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Akun Saya", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header: Foto Profil & Username
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "@FACHRYMOMO", // Sesuaikan dengan username kak
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // 2. Bar Status: Bayar, Dikirim, Nilai/Favorit
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatusItem(Icons.payment, "BAYAR"),
                  _buildStatusItem(Icons.local_shipping, "DIKIRIM"),
                  _buildStatusItem(Icons.star, "NILAI / FAVORIT"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. Banner Voucher (Bentuk Jajar Genjang/Slanted)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Transform(
                transform: Matrix4.skewX(-0.1), // Efek miring sesuai sketsa
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3D421), // Warna kuning khas aplikasi kak
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "V O U C H E R",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 2),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 4. Label Rekomendasi
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "REKOMENDASI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 5. Grid/List Rekomendasi (3 Kotak di bawah)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRecBox(),
                  _buildRecBox(),
                  _buildRecBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pendukung untuk Bar Status
  Widget _buildStatusItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.black54),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Widget pendukung untuk Kotak Rekomendasi
  Widget _buildRecBox() {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: const Icon(Icons.image, color: Colors.grey),
    );
  }
}