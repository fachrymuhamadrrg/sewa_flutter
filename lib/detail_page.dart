import 'package:flutter/material.dart';
import 'checkout_page.dart';
List<Map<String, String>> favoriteItems = [];

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
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
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
                      widget.specs,
                      style: const TextStyle(fontSize: 15, height: 1.8),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      // Tombol Favorit tetap berfungsi normal
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border, 
                            color: Colors.red
                          ),

                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite; // Mengubah tampilan ikon di layar

                                if (isFavorite) {
                                  // 1. Fungsi menambah data ke list global agar muncul di FavoritePage
                                  favoriteItems.add({
                                    'name': widget.name,
                                    'price': widget.price,
                                    'imageUrl': widget.imageUrl,
                                  });
                                } else {
                                  // 2. Fungsi menghapus data dari list global jika batal favorit
                                  favoriteItems.removeWhere((item) => item['name'] == widget.name);
                                }
                              });

                              // 3. Menampilkan notifikasi singkat di bawah layar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isFavorite ? "Berhasil disimpan!" : "Dihapus dari favorit"),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Tombol Sewa Sekarang diarahkan ke CheckoutPage
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF3D421),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutPage(
                                  name: widget.name,
                                  price: widget.price,
                                  imageUrl: widget.imageUrl,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Sewa Sekarang", 
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
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
