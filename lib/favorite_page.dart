import 'package:flutter/material.dart';
import 'detail_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // 1. List untuk menampung item yang dicentang
  final List<Map<String, String>> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alat Favorit")),
      body: favoriteItems.isEmpty
          ? const Center(child: Text("Belum ada favorit"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: favoriteItems.length,
                    itemBuilder: (context, index) {
                      final item = favoriteItems[index];
                      // 2. Gunakan CheckboxListTile agar bisa dicentang
                      return CheckboxListTile(
                        secondary: Image.network(item['imageUrl']!, width: 50),
                        title: Text(item['name']!),
                        subtitle: Text(item['price']!),
                        value: selectedItems.contains(item),
                        onChanged: (bool? checked) {
                          setState(() {
                            if (checked == true) {
                              selectedItems.add(item);
                            } else {
                              selectedItems.remove(item);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                // 3. Tombol Sewa Semua yang Dicentang
                if (selectedItems.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        foregroundColor: const Color.fromARGB(
                          255,
                          251,
                          255,
                          255,
                        ),
                      ),
                      onPressed: () {
                        // Di sini nanti arahkan ke halaman Checkout/Sewa
                        print("Menyewa: ${selectedItems.length} alat");
                      },
                      child: Text("Sewa ${selectedItems.length} Alat Terpilih"),
                    ),
                  ),
              ],
            ),
    );
  }
}
