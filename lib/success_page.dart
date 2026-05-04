import 'package:flutter/material.dart';
import 'home_page.dart'; // Sesuaikan jika nama file home Anda berbeda
import 'history_page.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 24),
            const Text(
              "Pesanan Berhasil!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Kembali ke halaman utama (Home)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 45),
              ),
              child: const Text("Kembali ke Beranda"),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                // Pergi ke halaman Riwayat Transaksi
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(200, 45),
              ),
              child: const Text("Lihat Riwayat Transaksi"),
            ),
          ],
        ),
      ),
    );
  }
}
