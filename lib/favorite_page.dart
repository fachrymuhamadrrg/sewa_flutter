import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorit Saya"),
        backgroundColor: const Color(0xFFF3D421),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2, // Ini sementara kita isi 2 dulu ya kak buat contoh
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  "https://via.placeholder.com/150", // Nanti ganti link gambar asli
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text("Alat Favorit ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text("Rp 50.000 / hari", style: TextStyle(color: Colors.orange)),
              trailing: const Icon(Icons.favorite, color: Colors.red),
              onTap: () {
                // Logika buat buka detail dari sini
              },
            ),
          );
        },
      ),
    );
  }
}