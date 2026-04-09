import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- UKURAN LOGO DISESUAIKAN AGAR TIDAK TERLALU BESAR ---
            Image.asset(
              'assets/image/2.png',
              height: 250,
              width: 250,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF05412)),
                );
              },
            ),

            const SizedBox(height: 20), // JARAK ANTARA LOGO DAN TEKS
            // --- NAMA APLIKASI ---
            const Text(
              "KuliKu",
              style: TextStyle(
                fontSize: 28, // UKURAN FONT SEDIKIT DIKECILKAN BIAR SERASI
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
