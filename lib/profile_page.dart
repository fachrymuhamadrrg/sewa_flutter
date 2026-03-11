import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Pengguna"),
        backgroundColor: const Color(0xFF594C03),
      ),
      body: const Center(
        child: Text("Halaman Profil Fachry"),
      ),
    );
  }
}