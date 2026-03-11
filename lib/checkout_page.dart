import 'package:flutter/material.dart';

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
  
  // Logika ambil angka dari string harga (misal "Rp 50.000" jadi 50000)
  int get hargaInt => int.parse(widget.price.replaceAll(RegExp(r'[^0-9]'), ''));

  @override
  Widget build(BuildContext context) {
    int total = hargaInt * durasi * jumlah;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Sewa")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ringkasan Alat
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
                      Text(widget.price, style: const TextStyle(color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 30),

            // Input Durasi & Jumlah
            const Text("Durasi Sewa (Hari)", style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: durasi.toDouble(),
              min: 1,
              max: 30,
              divisions: 29,
              label: "$durasi Hari",
              activeColor: const Color(0xFFF3D421),
              onChanged: (val) => setState(() => durasi = val.toInt()),
            ),

            const Text("Jumlah Alat", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                IconButton(onPressed: () => setState(() => jumlah > 1 ? jumlah-- : null), icon: const Icon(Icons.remove_circle_outline)),
                Text("$jumlah", style: const TextStyle(fontSize: 18)),
                IconButton(onPressed: () => setState(() => jumlah++), icon: const Icon(Icons.add_circle_outline)),
              ],
            ),

            const Divider(),
            // Voucher
            ListTile(
              leading: const Icon(Icons.confirmation_number_outlined, color: Colors.blue),
              title: const Text("Pakai Voucher Diskon"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {}, // Nanti bisa ditambahin fitur voucher
            ),

            // Metode Pembayaran
            const Text("Metode Pembayaran", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: metodeBayar,
              isExpanded: true,
              items: ['Transfer Bank', 'E-Wallet (Dana/OVO)', 'Bayar di Tempat (COD)']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => metodeBayar = val!),
            ),
            
            const SizedBox(height: 50),
            // Ringkasan Total
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Pembayaran"),
                      Text("Rp $total", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
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
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Pesanan Berhasil Diproses!"), backgroundColor: Colors.green),
            );
            Navigator.pop(context);
          },
          child: const Text("KONFIRMASI PEMBAYARAN", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}