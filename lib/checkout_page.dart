import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import ini wajib untuk format titik

class CheckoutPage extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;

  const CheckoutPage({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int durasi = 1;
  int jumlah = 1;
  String metodeBayar = 'Transfer Bank';

  /// Fungsi formal untuk format mata uang ke Rupiah dengan pemisah titik
  String formatRupiah(int number) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(number);
  }

  int get hargaInt => int.parse(widget.price.replaceAll(RegExp(r'[^0-9]'), ''));

  @override
  Widget build(BuildContext context) {
    int total = hargaInt * durasi * jumlah;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Sewa", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 90, 78, 8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Ringkasan Produk ---
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(widget.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(widget.price, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 30),

            // --- Durasi Sewa ---
            const Text("Durasi Sewa (Hari)", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () => setState(() => durasi > 1 ? durasi-- : null),
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("$durasi Hari", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  onPressed: () => setState(() => durasi++),
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --- Jumlah Alat ---
            const Text("Jumlah Alat", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  onPressed: () => setState(() => jumlah > 1 ? jumlah-- : null),
                  icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("$jumlah Unit", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  onPressed: () => setState(() => jumlah++),
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                ),
              ],
            ),

            // GAP FIX: Saya hapus double divider di sini agar jarak ke voucher normal
            const Divider(height: 40),

            // --- Voucher ---
            const Text("Voucher", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade200),
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue.shade50,
              ),
              child: ListTile(
                leading: const Icon(Icons.confirmation_number_outlined, color: Colors.blue),
                title: const Text("Pakai Voucher Diskon", style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 25),

            // --- Metode Pembayaran ---
            const Text("Metode Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: metodeBayar,
                  isExpanded: true,
                  items: ['Transfer Bank', 'E-Wallet (Dana/OVO)', 'Bayar di Tempat (COD)']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => metodeBayar = val!),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // --- Rincian Total (SUDAH PAKAI TITIK) ---
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Pembayaran", style: TextStyle(fontSize: 16)),
                  Text(
                    formatRupiah(total), // Memanggil fungsi format titik
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF3D421),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () {},
          child: const Text("KONFIRMASI PEMBAYARAN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}