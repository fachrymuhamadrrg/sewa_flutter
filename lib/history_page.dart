import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Sewa"),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: const Center(child: Text("Belum ada riwayat transaksi.")),
    );
  }
}
