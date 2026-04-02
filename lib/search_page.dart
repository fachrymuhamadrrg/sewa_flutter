import 'package:flutter/material.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  /// Master Data: Kumpulan data statis yang berfungsi sebagai sumber pencarian.
  /// Dalam pengembangan lebih lanjut, data ini dapat diambil melalui API atau Database.
  final List<Map<String, String>> allTools = [
    {
      "name": "Mesin Molen Beton",
      "price": "Rp 150.000 / hari",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDGvsr1gFmVIJTP_wtS30qv-qJ2K5LLBn_lQ&s",
      "specs": "Merek: Tiger\nKapasitas: 500 Liter",
    },
    {
      "name": "Mesin Bor",
      "price": "Rp 50.000 / hari",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qBEdYWkBBByPMbPquL70CC2M62muAzEAmQ&s",
      "specs": "Merek: Bosch GSB 550",
    },
    {
      "name": "Gergaji Potong",
      "price": "Rp 55.000 / hari",
      "image":
          "https://tehniq.com/cdn/shop/products/Jual-Mesin-Potong-Gergaji-Kayu-Genggam-Portabe-Maktec-MT583-Circular-Saw_800x_crop_center.jpg?v=1599200764",
      "specs": "Merek: Maktec MT583",
    },
    {
      "name": "Mesin Las",
      "price": "Rp 55.000 / hari",
      "image":
          "https://harapanutamaindonesia.com/wp-content/uploads/2021/07/Lakoni.jpg",
      "specs": "Merek: Lakoni",
    },
  ];

  /// displayList: Variabel State yang menampung hasil pemfilteran dinamis.
  List<Map<String, String>> displayList = [];

  @override
  void initState() {
    super.initState();

    /// Inisialisasi awal: Menampilkan daftar kosong atau semua data saat halaman dimuat.
    displayList = [];
  }

  /// Fungsi updateList: Mengimplementasikan logika pemfilteran (filtering logic).
  /// Menggunakan algoritma perbandingan string secara case-insensitive.
  void updateList(String value) {
    setState(() {
      /// .where() menyaring data berdasarkan kondisi yang diberikan.
      /// .contains() mengecek apakah keyword terdapat dalam nama alat.
      displayList = allTools
          .where(
            (element) =>
                element["name"]!.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),

        /// Mengintegrasikan TextField ke dalam AppBar untuk antarmuka pencarian yang efisien.
        title: TextField(
          autofocus: true, // Mengaktifkan fokus otomatis pada input teks.
          onChanged: (value) =>
              updateList(value), // Listener untuk memicu fungsi filtering.
          style: const TextStyle(color: Color.fromARGB(255, 241, 241, 241)),
          decoration: const InputDecoration(
            hintText: "Cari alat bangunan...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            /// Kondisional Rendering: Menampilkan pesan jika data tidak ditemukan atau list kosong.
            child: displayList.isEmpty
                ? const Center(
                    child: Text("Hasil pencarian akan muncul di sini."),
                  )
                : ListView.builder(
                    itemCount: displayList.length,

                    /// ListView.builder mengoptimalkan penggunaan memori (Lazy Loading).
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        /// Navigasi ke halaman detail dengan membawa parameter data yang dipilih.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailAlatPage(
                              name: displayList[index]['name']!,
                              price: displayList[index]['price']!,
                              imageUrl: displayList[index]['image']!,
                              specs: displayList[index]['specs']!,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        displayList[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(displayList[index]['price']!),
                      leading: Image.network(
                        displayList[index]['image']!,
                        width: 50,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
