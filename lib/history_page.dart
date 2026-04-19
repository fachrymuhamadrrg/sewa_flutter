import 'package:flutter/material.dart';

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
            onPressed: () {},
          ),
          title: const Text(
            "History",
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
          bottom: TabBar(
            indicatorColor: const Color(0xFFF05412),
            labelColor: const Color(0xFFF05412),
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
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
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildHistoryCard(
          "Stamper Kuda",
          "Penyewaan Alat Ponorogo",
          "Take Away",
          "https://image1ws.indotrading.com/s3/productimages/webp/co35493/p251897/w300-h300/65b1da26-c1ea-41ac-8e00-ea71ef59edf5w.jpg",
          hasReminder: true,
        ),
        const SizedBox(height: 15),
        _buildHistoryCard(
          "Mesin Senso",
          "Mokopi Kelapa Gading",
          "Delivery",
          "https://image1ws.indotrading.com/s3/productimages/webp/co283020/p1663341/w600-h600/57a24e25-1def-4b48-91ad-3b9c3a6d1593.jpg",
          hasActionButtons: true,
        ),
      ],
    );
  }

  Widget _buildHistoryCard(
    String title,
    String subtitle,
    String tag,
    String imgUrl, {
    bool hasReminder = false,
    bool hasActionButtons = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
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
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF05412).withValues(alpha: 0.1),
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
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),

          if (hasReminder) ...[
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Remind me 30 minutes earlier",
                  style: TextStyle(fontSize: 13, color: Colors.black87),
                ),
                Switch(
                  value: true,
                  onChanged: (val) {},
                  activeThumbColor: const Color(0xFF00B686),
                ),
              ],
            ),
          ],

          if (hasActionButtons) ...[
            const Divider(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xFFE0E0E0)),
                    ),
                    child: const Text(
                      "Cancel Order",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00B686),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Track Driver",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
