import 'package:flutter/material.dart';
import 'database.dart';
import 'main.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Riwayat Transaksi",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFFF05412),
            labelColor: Color(0xFFF05412),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "Sedang Dipinjam"),
              Tab(text: "Selesai"),
              Tab(text: "Dibatalkan"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildActiveTab(),
            const Center(child: Text("Belum ada transaksi selesai")),
            const Center(child: Text("Belum ada transaksi dibatalkan")),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveTab() {
    return ValueListenableBuilder<List<Alat>>(
      valueListenable: globalHistory,
      builder: (context, listAlat, child) {
        if (listAlat.isEmpty) {
          return const Center(child: Text("Belum ada transaksi aktif"));
        }

        if (listAlat.isEmpty) {
          return const Center(child: Text("Belum ada transaksi aktif"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: listAlat.length,
          itemBuilder: (context, index) {
            final item = listAlat[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: _buildHistoryCard(
                context,
                item.id,
                item.name,
                item.location,
                "Delivery",
                item.imageUrl,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHistoryCard(
    BuildContext context,
    int id,
    String title,
    String subtitle,
    String tag,
    String imgUrl,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imgUrl,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 60),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF05412).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: Color(0xFFF05412),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        // Hapus dari global state
                        globalHistory.value = globalHistory.value.where((a) => a.id != id).toList();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
