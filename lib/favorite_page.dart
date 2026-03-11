import 'package:flutter/material.dart';
import 'detail_page.dart'; // Import agar bisa akses favoriteItems

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alat Favorit")),
      body: favoriteItems.isEmpty
          ? const Center(child: Text("Belum ada favorit"))
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return ListTile(
                  leading: Image.network(item['imageUrl']!, width: 50),
                  title: Text(item['name']!),
                  subtitle: Text(item['price']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        // Menghapus dari list global
                        favoriteItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}