import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // 1. Ini adalah alat "Penangkap Teks" kita
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profil")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 2. Ini adalah kolom ketikannya (Form)
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Nomor HP"),
            ),
            const SizedBox(height: 30),

            // 3. Tombol untuk menyimpannya nanti
            SizedBox(
              width: double.infinity, // Supaya tombolnya panjang
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('nama_user', nameController.text);
                  await prefs.setString('email_user', emailController.text);
                  await prefs.setString('phone_user', phoneController.text);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profil berhasil disimpan!"),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan Profil"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
