import 'package:flutter/material.dart';

class DetailAlatPage extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;
  final String specs;

  const DetailAlatPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.specs,
  });

  @override
  State<DetailAlatPage> createState() => _DetailAlatPageState();
}

class _DetailAlatPageState extends State<DetailAlatPage> {
  // Tambahkan ; di akhir dan perbaiki status awal
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gunakan widget.imageUrl karena datanya ada di class DetailAlatPage
            Image.network(widget.imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gunakan widget.name
                  Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  // Gunakan widget.price
                  Text(widget.price, style: const TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  
                  const Text("Spesifikasi Teknis", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      widget.specs, // Gunakan widget.specs
                      style: const TextStyle(fontSize: 15, height: 1.8),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          // Ganti icon berdasarkan status klik
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border, 
                            color: Colors.red
                          ),
                          onPressed: () {
                            // Fungsi setState buat refresh tampilan saat diklik
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(isFavorite 
                                  ? "Berhasil ditambahkan ke Favorit!" 
                                  : "Dihapus dari Favorit"),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF3D421),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // Logika sewa
                            },
                            child: const Text(
                              "Sewa sekarang",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}